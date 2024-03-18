import 'package:ecommerce/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:ecommerce/presentation/screens/login/login_screen.dart';
import 'package:ecommerce/presentation/screens/signup/signup_screen.dart';
import 'package:ecommerce/presentation/screens/splash/splash_screen.dart';
import 'package:ecommerce/resource/di.dart';
import 'package:ecommerce/utils/string_contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneratedRoutes {
  final AuthenticationBloc _authenticationBloc = sl.get<AuthenticationBloc>();

  Route<dynamic> generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        Future.delayed(const Duration(milliseconds: 2500), () {
          _authenticationBloc.add(CheckAuthenticationET());
        });
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _authenticationBloc, child: const SplashScreen()));
      case StrConst.loginScreen:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case StrConst.signUpScreen:
        return CupertinoPageRoute(builder: (_) => const SignUpScreen());

      case StrConst.homeScreen:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case StrConst.cartScreen:
        return CupertinoPageRoute(builder: (_) => CartScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
