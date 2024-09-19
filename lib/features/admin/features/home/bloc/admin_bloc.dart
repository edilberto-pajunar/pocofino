import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pocofino/app/bloc/app_bloc.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(const AdminState()) {
    on<AdminInitRequested>(_onInitRequested);
    on<AdminInitOrdersRequested>(_onInitOrdersRequested);
    on<AdminFailed>(_onAdminFailed);
  }

  void _onInitRequested(
    AdminInitRequested event,
    Emitter<AdminState> emit,
  ) async {
    add(AdminInitOrdersRequested());
  }

  void _onInitOrdersRequested(
    AdminInitOrdersRequested event,
    Emitter<AdminState> emit,
  ) async {
    try {} catch (e) {}
  }

  void _onAdminFailed(
    AdminFailed event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(
      error: event.error,
      status: AdminStatus.failed,
    ));
  }
}
