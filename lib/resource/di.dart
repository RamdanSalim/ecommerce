import 'package:ecommerce/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bloc/firebase_authentication/firebase_auth_bloc.dart';
import 'package:ecommerce/bloc/product/product_bloc.dart';
import 'package:ecommerce/data/repository/firebase_repository/authentiacation_repository.dart';
import 'package:ecommerce/data/repository/product_repository.dart';
import 'package:ecommerce/data/repository/user_repository.dart';
import 'package:ecommerce/resource/api_query.dart';
import 'package:ecommerce/resource/route_helper.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDB() {
  sl.registerFactory<AuthenticationBloc>(() => AuthenticationBloc());
  sl.registerSingleton<GeneratedRoutes>(GeneratedRoutes());
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo());
  sl.registerLazySingleton<ProductRepo>(() => ProductRepo());
  sl.registerFactory<FirebaseAuthBloc>(() => FirebaseAuthBloc());
  sl.registerLazySingleton<UserRepo>(() => UserRepo());
  sl.registerLazySingleton<ApiQuery>(() => ApiQuery());
  sl.registerFactory<ProductBloc>(() => ProductBloc());
  sl.registerSingleton<CartBloc>(CartBloc());
}
