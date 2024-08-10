part of 'menu_bloc.dart';

enum MenuStatus { initial, loading, success, failure }

final class MenuState extends Equatable {
  final List<Product> products;
  final MenuStatus status;
  final String? error;

  const MenuState({
    this.products = const [],
    this.status = MenuStatus.initial,
    this.error,
  });

  MenuState copyWith({
    List<Product>? products,
    MenuStatus? status,
    String? error,
  }) {
    return MenuState(
      products: products ?? this.products,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        products,
        status,
        error,
      ];
}
