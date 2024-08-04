part of 'productr_bloc.dart';

sealed class ProductrState extends Equatable {
  const ProductrState();
  
  @override
  List<Object> get props => [];
}

final class ProductrInitial extends ProductrState {}
