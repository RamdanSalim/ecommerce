import 'package:ecommerce/utils/color_constants.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:ecommerce/utils/string_contants.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function() onSubmit;

  const TextFormFieldWidget(
      {super.key,
      required this.hint,
      required this.textEditingController,
      required this.focusNode,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig().getWidth(20),
          vertical: SizeConfig().getHeight(15)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ClrConst.whiteClr,
            boxShadow: [
              BoxShadow(
                  color: ClrConst.greyClr.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2))
            ]),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: hint == StrConst.emailStr
              ? TextInputType.emailAddress
              : TextInputType.text,
          obscureText: (hint == StrConst.passwordStr ||
                  hint == StrConst.confirmPasswordStr)
              ? true
              : false,
          onFieldSubmitted: (val) {
            onSubmit();
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: SizeConfig().getWidth(20))),
        ),
      ),
    );
  }
}
