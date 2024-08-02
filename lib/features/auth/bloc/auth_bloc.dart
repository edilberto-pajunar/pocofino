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
    on<AuthGoogleSignInAttempted>(_onGoogleSignInAttempted);
    on<AuthSignInFailed>(_onSignInFailed);
  }

  Future<void> _onGoogleSignInAttempted(
    AuthGoogleSignInAttempted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LoginStatus.loggingIn));
      final userCreds = await _authRepository.signInWithGoogle(
        event.userId,
      );
      if (userCreds == null) {
        return emit(state.copyWith(status: LoginStatus.cancelled));
      }

      emit(state.copyWith(status: LoginStatus.loginSuccess));
    } catch (e) {
      add(AuthSignInFailed(e.toString()));
      rethrow;
    }
  }

  void _onSignInFailed(
    AuthSignInFailed event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
      status: LoginStatus.loginFailure,
      error: event.signInException,
    ));
  }
}
