import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState()) {
    on<AuthCreateAccountRequested>(_onCreateAccountRequested);
    on<AuthAdminSignInAttempted>(_onAdminSignInAttempted);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthStoreTokenRequested>(_onStoreTokenRequested);
    on<AuthSignInFailed>(_onSignInFailed);
  }

  FutureOr<void> _onCreateAccountRequested(
    AuthCreateAccountRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      await _authRepository.createAccount(
        username: event.username,
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      add(AuthSignInFailed(e.toString()));
    }
  }

  FutureOr<void> _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final token = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      add(AuthStoreTokenRequested(token));
      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      add(AuthSignInFailed(e.toString()));
    }
  }


  Future<void> _onAdminSignInAttempted(
    AuthAdminSignInAttempted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final userCreds = await _authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      if (userCreds == null) {
        return emit(state.copyWith(status: AuthStatus.cancelled));
      }

      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      add(AuthSignInFailed(e.toString()));
      rethrow;
    }
  }

  void _onStoreTokenRequested(
    AuthStoreTokenRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.storeToken("bearer", event.token);
  }

  void _onSignInFailed(
    AuthSignInFailed event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
      status: AuthStatus.failure,
      error: event.signInException,
    ));
  }
}
