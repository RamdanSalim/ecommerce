part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingST extends ProductState {
  final bool isLoading;

  const ProductLoadingST({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class ProductLoadedST extends ProductState {
  final List<ProductModel> productModel;

  const ProductLoadedST({required this.productModel});

  @override
  List<Object> get props => [productModel];
}

class ProductErrorST extends ProductState {
  final String errMsg;

  const ProductErrorST({required this.errMsg});

  @override
  List<Object> get props => [errMsg];
}
