import 'dart:developer';

import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bloc/product/product_bloc.dart';
import 'package:ecommerce/data/models/product_adpater.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/presentation/screens/home/components/product_tile.dart';
import 'package:ecommerce/presentation/widgets/custom_app_bar.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resource/di.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductBloc? _productBloc;
  CartBloc? _cartBloc;

  @override
  void initState() {
    _productBloc = sl.get<ProductBloc>();
    _cartBloc = sl.get<CartBloc>();

    _productBloc!.add(GetProductET());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: _cartBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Home Screen',
            cartNum: 10,
          ),
          body: BlocConsumer<ProductBloc, ProductState>(
            bloc: _productBloc,
            listener: (context, state) {
              log(state.toString());
            },
            builder: (context, state) {
              List<ProductModel> productModel = [];
              ProductModel productModelData = ProductModel();

              if (state is ProductLoadingST) {
                if (state.isLoading == true) {}
              }

              if (state is ProductLoadedST) {
                productModel = state.productModel;
              }
              return SafeArea(
                child: Column(
                  children: [
                    Flexible(
                        child: GridView.builder(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig().getHeight(20),
                                horizontal: SizeConfig().getWidth(20)),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.75,
                                    crossAxisCount: 2,
                                    crossAxisSpacing:
                                        SizeConfig().getHeight(20),
                                    mainAxisSpacing: SizeConfig().getWidth(20)),
                            itemCount: productModel.length,
                            itemBuilder: (context, index) {
                              return ProductTile(
                                  onTapped: () {
                                    _productAdd(ProductAdapter(
                                        id: productModel[index].id!,
                                        name: productModel[index].title!,
                                        price: productModel[index].price!,
                                        image: productModel[index].image!));
                                  },
                                  productModel: productModel[index]);
                            }))
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  _productAdd(ProductAdapter productAdapter) {
    _cartBloc!.add(AddProductET(productAdapter: productAdapter));
  }
}
