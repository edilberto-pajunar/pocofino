import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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

    if (token == null) return;

    try {
      emit(state.copyWith(status: AppStatus.loggingIn));

      await _authRepository.checkToken(token: token);
      emit(state.copyWith(status: AppStatus.authenticated, token: token));
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

  void _onAppFailed(
    AppFailed event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(
      status: AppStatus.failed,
      error: event.error,
    ));
  }
}
