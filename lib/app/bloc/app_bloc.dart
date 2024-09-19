import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;

  AppBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AppState()) {
    on<AppInitRequested>(_onInitRequested);
    on<AppInitAuthRequested>(_onInitAuthRequested);
    on<AppHomeIndexChanged>(_onHomeIndexChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppFailed>(_onAppFailed);
  }

  void _onInitRequested(
    AppInitRequested event,
    Emitter<AppState> emit,
  ) {
    add(AppInitAuthRequested());
  }

  void _onInitAuthRequested(
    AppInitAuthRequested event,
    Emitter<AppState> emit,
  ) async {
    final token = await _authRepository.readToken("bearer");

    try {
      if (token == null) {
        emit(state.copyWith(status: AppStatus.unathenticated));
        return;
      }

      emit(state.copyWith(status: AppStatus.loggingIn));

      final currentUser = await _authRepository.getInfo(token: token);
      emit(state.copyWith(
        status: AppStatus.authenticated,
        token: token,
        currentUser: currentUser,
      ));
    } catch (e) {
      emit(state.copyWith(status: AppStatus.unathenticated));
    }
  }

  void _onHomeIndexChanged(
    AppHomeIndexChanged event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(
      tabIndex: event.index,
    ));
  }

  void _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    await _authRepository.logout();
    emit(state.copyWith(status: AppStatus.unathenticated));
  }

  void _onAppFailed(
    AppFailed event,
    Emitter<AppState> emit,
  ) async {
    try {
      await _authRepository.logout();
      emit(state.copyWith(
        status: AppStatus.failed,
        error: event.error,
      ));
    } catch (e) {
      print(e);
    }
  }
}
