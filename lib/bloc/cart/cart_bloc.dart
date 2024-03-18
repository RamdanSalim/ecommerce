import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/product_adpater.dart';
import 'package:ecommerce/utils/string_contants.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart_event.dart';

part 'cart_state.dart';

Box<ProductAdapter> productBox = Hive.box<ProductAdapter>(StrConst.hiveCart);

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddProductET>(addProductMethod);
    on<LoadCartET>(loadCartMethod);
  }

  FutureOr<void> addProductMethod(AddProductET event, Emitter<CartState> emit) {
    log(event.productAdapter.id.toString());

    ProductAdapter? existingProduct = productBox.get(event.productAdapter.id);

    emit(const CartLoadingST(isLoading: true));

    if (existingProduct != null) {
      event.productAdapter.quantity++;
      productBox.put(existingProduct.id, existingProduct);
      log('quantity ${event.productAdapter.quantity.toString()}');
    } else {
      productBox.add(event.productAdapter);
    }

    log(productBox.length.toString());
  }

  FutureOr<void> loadCartMethod(LoadCartET event, Emitter<CartState> emit) {
    emit(const CartLoadingST(isLoading: true));
  }
}
