part of 'menu_bloc.dart';

class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

final class MenuInitRequested extends MenuEvent {}

final class MenuInitProductsRequested extends MenuEvent {}

final class MenuFailed extends MenuEvent {
  final String error;

  const MenuFailed(this.error);
}
