import 'package:ecommerce/presentation/widgets/button_widget.dart';
import 'package:ecommerce/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpWidget extends StatelessWidget {
  final String title;
  final Function() onTapped;

  const PopUpWidget({super.key, required this.title, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Container(
        width: 200.w,
        height: 250.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ClrConst.whiteClr,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 250.sp,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.sp),
            ButtonWidget(
              color: ClrConst.blackClr,
              title: 'OK',
              onTap: () {
                onTapped();
              },
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
