import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopuz/view/home/inProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../model/product_model.dart';
import '../style.dart';
import 'custom_image.dart';

class CustomProductItem extends StatelessWidget {
  final ProductModel product;
  final int index;
  final VoidCallback isLike;

  const CustomProductItem({Key? key, required this.product, required this.index, required this.isLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>InProduct(inP: product)));
          },
          child: Container(
            width: 350.w,
            height: 110.h,
      decoration: BoxDecoration(
          color: Style.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(24.r)),),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 110.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      color: Style.oneColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r),bottomLeft: Radius.circular(24.r)),
                      image: DecorationImage(
                          image: NetworkImage("${product.image}"),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // 5.verticalSpace,
                      Text(
                        (product.name?.substring(0, 1).toUpperCase() ?? "") +
                            (product.name?.substring(1) ?? ""),
                        overflow: TextOverflow.ellipsis,
                        style: Style.textStyleRegular(),
                      ),
                      SizedBox(
                          width: 170.w,
                          child: Expanded(child: Text("${product.desc}",style: Style.textStyleNorm(textColor: Style.darkGreyColor,size: 10),maxLines:2,overflow: TextOverflow.ellipsis,))),
                      Text(
                        NumberFormat.currency(
                                locale: 'en', symbol: "\$", decimalDigits: 0)
                            .format(product.price),
                        style: Style.textStyleAuth(),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon:product.isLike ? Icon(Icons.favorite,color: Style.primaryColor,) :Icon(Icons.favorite_border,color: Style.primaryColor,),
                  onPressed: isLike,
                ),
              ],
            ),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
