part of 'admin_bloc.dart';

class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class AdminInitRequested extends AdminEvent {}

class AdminInitOrdersRequested extends AdminEvent {}

class AdminFailed extends AdminEvent {
  final String error;

  AdminFailed(this.error);
}
