part of 'admin_bloc.dart';

enum AdminStatus { idle, loading, success, failed }

class AdminState extends Equatable {
  final AdminStatus status;
  final String error;

  const AdminState({
    this.status = AdminStatus.idle,
    this.error = "",
  });

  AdminState copyWith({
    AdminStatus? status,
    String? error,
  }) {
    return AdminState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
        error,
      ];
}
