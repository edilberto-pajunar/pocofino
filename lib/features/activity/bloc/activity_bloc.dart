import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';
import 'package:activity_repository/activity_repository.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository _activityRepository;
  final String _token;

  ActivityBloc({
    required ActivityRepository activityRepository,
    required String token,
  })  : _activityRepository = activityRepository,
        _token = token,
        super(const ActivityState()) {
    on<ActivityInitRequested>(_onInitRequested);
    on<ActivityOrdersRequested>(_onOrdersRequested);
    on<ActivityFailed>(_onActivityFailed);
  }

  void _onInitRequested(
    ActivityInitRequested event,
    Emitter<ActivityState> emit,
  ) {
    add(const ActivityOrdersRequested("pending"));
  }

  void _onOrdersRequested(
    ActivityOrdersRequested event,
    Emitter<ActivityState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ActivityStatus.loading));

      final orders = await _activityRepository.getActivities(
        _token,
        event.status,
      );
      emit(state.copyWith(
        status: ActivityStatus.success,
        orders: orders,
      ));
    } catch (e) {
      add(ActivityFailed(e.toString()));
    }
  }

  void _onActivityFailed(
    ActivityFailed event,
    Emitter<ActivityState> emit,
  ) {
    emit(state.copyWith(
      status: ActivityStatus.failed,
      error: event.error,
    ));
  }
}
