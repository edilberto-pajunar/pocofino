part of 'menu_bloc.dart';

enum MenuStatus { initial, loading, success, failure }

final class MenuState extends Equatable {
  final List<Product> products;
  final MenuStatus status;

  const MenuState({
    this.products = const [],
    this.status = MenuStatus.initial,
  });

  @override
  List<Object> get props => [
    products,
    status
  ];
}
