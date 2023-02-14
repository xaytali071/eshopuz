

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopuz/model/product_model.dart';
import 'package:eshopuz/view/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InProduct extends StatelessWidget {
 final  ProductModel  inP;
   InProduct({Key? key, required this.inP}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((inP.name?.substring(0, 1).toUpperCase() ?? "") +
            (inP.name?.substring(1) ?? ""),),
        centerTitle: true,
        backgroundColor: Style.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.h,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("${inP.image}")
                )
              ),
            ),
            Text((inP.name?.substring(0, 1).toUpperCase() ?? "") +
                (inP.name?.substring(1) ?? ""),style: Style.textStyleRegular2(),),
            Text("\$${inP.price}"),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
            child:
            Expanded(child: Text("${inP.desc}")))
          ],
        ),
      ),
    );
  }
}
