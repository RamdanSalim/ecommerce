import 'package:ecommerce/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce/utils/string_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is IsLoggedInST) {
          if (state.isLoggedIn == true) {
            Navigator.pushReplacementNamed(context, StrConst.homeScreen);
          } else {
            Navigator.pushReplacementNamed(context, StrConst.loginScreen);
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text('Splash Screen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
