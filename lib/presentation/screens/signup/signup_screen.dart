import 'package:ecommerce/bloc/firebase_authentication/firebase_auth_bloc.dart';
import 'package:ecommerce/presentation/widgets/pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../resource/di.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/screen_util.dart';
import '../../../utils/string_contants.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/text_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuthBloc? _authBloc;
  TextEditingController? _emailController,
      _passwordController,
      _confirmPasswordController;
  FocusNode? _emailNode, _passwordNode, _confirmPasswordNode;

  late bool? _isLoading;

  @override
  void initState() {
    _authBloc = sl.get<FirebaseAuthBloc>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    _confirmPasswordNode = FocusNode();
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => PopUpWidget(
                      title:
                          '${StrConst.signInSuccess} \n ${StrConst.returnToLogin}',
                      onTapped: () {
                        Navigator.pushReplacementNamed(
                            context, StrConst.loginScreen);
                      }));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: SizeConfig().getHeight(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: SizeConfig().getHeight(200),
                        child: Image.asset(StrConst.signInImg)),
                    const HeadingWidget(title: StrConst.signInStr),
                    SizedBox(
                      height: SizeConfig().getHeight(40),
                    ),
                    TextFormFieldWidget(
                      hint: StrConst.emailStr,
                      focusNode: _emailNode!,
                      textEditingController: _emailController!,
                      onSubmit: _passwordNode!.requestFocus,
                    ),
                    TextFormFieldWidget(
                        hint: StrConst.passwordStr,
                        textEditingController: _passwordController!,
                        focusNode: _passwordNode!,
                        onSubmit: () {}),
                    TextFormFieldWidget(
                        hint: StrConst.confirmPasswordStr,
                        textEditingController: _confirmPasswordController!,
                        focusNode: _confirmPasswordNode!,
                        onSubmit: () {}),
                    ButtonWidget(
                      isLoading: _isLoading,
                      color: ClrConst.blackClr,
                      title: StrConst.signInStr,
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
                              StrConst.alreadyHaveAccount,
                              style: TextStyle(
                                  fontSize: SizeConfig().getHeight(14)),
                            ),
                            SizedBox(
                              width: SizeConfig().getWidth(5),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, StrConst.loginScreen);
                              },
                              child: Text(
                                StrConst.loginStr,
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

  void _submit() async {
    _authBloc!.add(FireBaseSignInET(
        email: _emailController!.text,
        password: _passwordController!.text,
        confirmedPassword: _confirmPasswordController!.text));
  }
}
