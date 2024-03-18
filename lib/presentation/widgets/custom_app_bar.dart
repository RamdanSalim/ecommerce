import 'package:ecommerce/utils/color_constants.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final int cartNum;

  const CustomAppBar({super.key, this.title, required this.cartNum});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: SizeConfig().getHeight(70),
        decoration: BoxDecoration(
          color: ClrConst.blackClr,
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                color: ClrConst.greyClr.withOpacity(0.5),
                offset: const Offset(-2, 2))
          ],
        ),
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig().getWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                Text(
                  title != null ? title! : '',
                  style: TextStyle(
                      color: ClrConst.whiteClr,
                      fontSize: SizeConfig().getTextSize(18),
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  CupertinoIcons.cart_fill,
                  color: ClrConst.whiteClr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SizeConfig().getHeight(70));
}
