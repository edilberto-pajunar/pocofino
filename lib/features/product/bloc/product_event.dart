part of 'product_bloc.dart';

final class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class ProductQuantityIncremented extends ProductEvent {}

final class ProductQuantityDecremented extends ProductEvent {}
