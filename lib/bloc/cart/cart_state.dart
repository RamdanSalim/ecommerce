part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class ProductAddedST extends CartState {}

class ProductDeletedST extends CartState {}

class QuantityUpdatedST extends CartState {}

class CartLoadingST extends CartState {
  final bool isLoading;

  const CartLoadingST({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class ProductClearST extends CartState {}

class CartLoadedST extends CartState {}
