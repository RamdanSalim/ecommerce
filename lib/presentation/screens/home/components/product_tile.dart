import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/presentation/widgets/button_widget.dart';
import 'package:ecommerce/utils/color_constants.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:ecommerce/utils/string_contants.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  final Function() onTapped;

  const ProductTile(
      {super.key, required this.productModel, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ClrConst.whiteClr,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: ClrConst.greyClr.withOpacity(0.1),
                blurRadius: 8)
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig().getHeight(15),
            horizontal: SizeConfig().getWidth(15)),
        child: Stack(
          children: [
            Positioned(
                top: SizeConfig().getHeight(5),
                left: SizeConfig().getWidth(0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: getColor(productModel.rating!.rate!)),
                  height: SizeConfig().getHeight(18),
                  width: SizeConfig().getWidth(28),
                  child: Center(
                      child: Text(
                    productModel.rating!.rate != null
                        ? productModel.rating!.rate!.toString()
                        : '!',
                    style: TextStyle(
                      fontSize: SizeConfig().getTextSize(10),
                      fontWeight: FontWeight.w700, /*color: ClrConst.whiteClr*/
                    ),
                  )),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig().getHeight(70),
                      width: SizeConfig().getWidth(50),
                      child: Image.network(
                        productModel.image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig().getHeight(15),
                ),
                Text(
                  productModel.title != null
                      ? productModel.title!
                      : 'Unknown product',
                  style: TextStyle(fontSize: SizeConfig().getTextSize(14)),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: SizeConfig().getHeight(10),
                ),
                Text(
                  productModel.price != null
                      ? '${StrConst.dollar} ${productModel.price}'
                      : 'Unknown price',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig().getTextSize(14)),
                ),
                SizedBox(
                  height: SizeConfig().getHeight(15),
                ),
                ButtonWidget(
                    height: SizeConfig().getHeight(10),
                    width: SizeConfig().getWidth(40),
                    fontSize: SizeConfig().getTextSize(12),
                    color: ClrConst.blackClr,
                    title: 'Add to cart',
                    onTap: () {
                      onTapped();
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color? getColor(double? rating) {
    if (rating! >= 4.5) {
      return ClrConst.fiveStar;
    }
    if (rating >= 4 && rating < 4.5) {
      return ClrConst.fourStar;
    }

    if (rating >= 3 && rating < 4) {
      return ClrConst.threeStar;
    }
    if (rating >= 2 && rating < 3) {
      return ClrConst.twoStar;
    }
    if (rating >= 0 && rating < 2) return ClrConst.oneStar;
    return ClrConst.oneStar;
  }
}
