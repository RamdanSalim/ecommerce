import 'dart:developer';

import 'package:ecommerce/bloc/firebase_authentication/firebase_auth_bloc.dart';
import 'package:ecommerce/bloc/firebase_authentication/firebase_auth_bloc.dart';
import 'package:ecommerce/presentation/widgets/button_widget.dart';
import 'package:ecommerce/presentation/widgets/heading_widget.dart';
import 'package:ecommerce/utils/color_constants.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:ecommerce/utils/string_contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../resource/di.dart';
import '../../widgets/text_form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _emailController, _passwordController;
  FocusNode? _emailNode, _passwordNode;
  FirebaseAuthBloc? _authBloc;
  late bool? _isLoading;

  @override
  void initState() {
    _authBloc = sl.get<FirebaseAuthBloc>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    _isLoading = false;

    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    _emailNode!.dispose();
    _passwordNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('login');
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<FirebaseAuthBloc, FirebaseAuthState>(
          bloc: _authBloc,
          listener: (context, state) {
            if (state is FireBaseLoadingST) {
              _isLoading = state.isLoading;
            }

            if (state is FireBaseAuthErrorST) {
              Fluttertoast.showToast(
                  msg: state.errMsg, backgroundColor: ClrConst.redPastel);
            }

            if (state is FireBaseAuthSuccessST) {
              Fluttertoast.showToast(msg: 'Logged in Successful');
              Navigator.pushReplacementNamed(context, StrConst.homeScreen);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: SizeConfig().getHeight(100)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: SizeConfig().getHeight(200),
                        child: Image.asset(StrConst.loginImg)),
                    const HeadingWidget(title: StrConst.loginStr),
                    SizedBox(
                      height: SizeConfig().getHeight(40),
                    ),
                    TextFormFieldWidget(
                      hint: StrConst.emailStr,
                      focusNode: _emailNode!,
                      textEditingController: _emailController!,
                      onSubmit: () {
                        _passwordNode!.requestFocus();
                      },
                    ),
                    TextFormFieldWidget(
                        hint: StrConst.passwordStr,
                        textEditingController: _passwordController!,
                        focusNode: _passwordNode!,
                        onSubmit: () {}),
                    ButtonWidget(
                      isLoading: _isLoading,
                      color: ClrConst.blackClr,
                      title: StrConst.loginStr,
                      onTap: _submit,
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig().getWidth(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StrConst.doNotHaveAccount,
                              style: TextStyle(
                                  fontSize: SizeConfig().getHeight(14)),
                            ),
                            SizedBox(
                              width: SizeConfig().getWidth(5),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, StrConst.signUpScreen);
                              },
                              child: Text(
                                StrConst.signInStr,
                                style: TextStyle(
                                    fontSize: SizeConfig().getTextSize(16),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _submit() {
    _authBloc!.add(FireBaseLoginET(
        email: _emailController!.text, password: _passwordController!.text));
  }
}
