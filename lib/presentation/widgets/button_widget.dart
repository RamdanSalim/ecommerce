import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';
import '../../utils/color_constants.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String title;
  final Function() onTap;
  final bool? isLoading;
  final double? width, height, fontSize;

  const ButtonWidget(
      {Key? key,
      this.isLoading,
      required this.color,
      required this.title,
      required this.onTap,
      this.height,
      this.width,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height == null
            ? SizeConfig().getHeight(15)
            : SizeConfig().getHeight(0),
        horizontal: width == null
            ? SizeConfig().getWidth(20)
            : SizeConfig().getWidth(0),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              color: color,
              shape: isLoading == true ? BoxShape.circle : BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: ClrConst.greyClr.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            curve: Curves.fastOutSlowIn,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 1000),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height == null
                      ? SizeConfig().getHeight(15)
                      : SizeConfig().getHeight(10)),
              child: Center(
                child: isLoading == true
                    ? const CircularProgressIndicator(
                        color: ClrConst.whiteClr,
                      )
                    : Text(
                        title,
                        style: TextStyle(
                          color: ClrConst.whiteClr,
                          fontSize: fontSize == null
                              ? SizeConfig().getTextSize(18)
                              : SizeConfig().getTextSize(fontSize!),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
