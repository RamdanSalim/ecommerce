import 'package:flutter/material.dart';

import '../../utils/screen_util.dart';

class HeadingWidget extends StatelessWidget {
  final String title;

  const HeadingWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig().getHeight(15)),
      child: Text(
        title,
        style: TextStyle(
            fontSize: SizeConfig().getTextSize(22),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
