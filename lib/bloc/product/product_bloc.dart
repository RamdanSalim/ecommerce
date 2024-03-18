import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/repository/product_repository.dart';
import 'package:equatable/equatable.dart';

import '../../resource/di.dart';

part 'product_event.dart';

part 'product_state.dart';

ProductRepo _productRepo = sl.get<ProductRepo>();

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductLoadingST(isLoading: true)) {
    on<GetProductET>(getProductMethod);
  }

  FutureOr<void> getProductMethod(
      GetProductET event, Emitter<ProductState> emit) async {
    emit(const ProductLoadingST(isLoading: true));
    try {
      Response? response = await _productRepo.getProduct();

      if (response!.statusCode == 200) {
        emit(const ProductLoadingST(isLoading: false));
        var s = json.encode(response.data);
        List<ProductModel> productModel = productModelFromJson(s);
        emit(ProductLoadedST(productModel: productModel));
      }
    } catch (e) {
      log(e.toString());
      emit(const ProductLoadingST(isLoading: false));
    }
  }
}
