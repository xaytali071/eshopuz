import 'package:eshopuz/view/component/custom_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../model/product_model.dart';
import '../style.dart';

class CategoryList extends StatefulWidget {
  final List product;
  const CategoryList({Key? key,required this.product}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
 // List<ProductModel> product=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.product.length,
          itemBuilder:(context,index){
            return Column(
              children: [
                Container(
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
                                image: NetworkImage("${widget.product[index].image}"),
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
                            SizedBox(
                              width: 160.w,
                              child: Text(
                                (widget.product[index].name?.substring(0, 1).toUpperCase() ?? "") +
                                    (widget.product[index].name?.substring(1) ?? ""),
                                overflow: TextOverflow.ellipsis,
                                style: Style.textStyleRegular(),
                              ),
                            ),
                            SizedBox(
                                width: 170.w,
                                child: Expanded(child: Text("${widget.product[index].desc}",style: Style.textStyleNorm(textColor: Style.darkGreyColor,size: 10),maxLines:2,overflow: TextOverflow.ellipsis,))),
                            Text(
                              NumberFormat.currency(
                                  locale: 'en', symbol: "\$", decimalDigits: 0)
                                  .format(widget.product[index].price),
                              style: Style.textStyleAuth(),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon:widget.product[index].isLike ? Icon(Icons.favorite,color: Style.primaryColor,) :Icon(Icons.favorite_border,color: Style.primaryColor,),
                        onPressed:(){
                         widget.product[index].isLike !=widget.product[index].isLike;
                        },
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
              ],
            );
          }),
    );
  }
}
