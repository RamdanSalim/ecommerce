part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductET extends CartEvent {
  final ProductAdapter productAdapter;

  const AddProductET({required this.productAdapter});

  @override
  List<Object> get props => [productAdapter];
}

class DeleteProductET extends CartEvent {}

class EditQuantityET extends CartEvent {}

class LoadCartET extends CartEvent {}
