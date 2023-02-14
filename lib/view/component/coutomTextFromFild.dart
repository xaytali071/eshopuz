import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style.dart';

class CoustomTextFromFild extends StatelessWidget {
  final TextEditingController controller;
  final Icon icon;
  final ValueChanged<String>? onChange;
  final FocusNode? node;

  const CoustomTextFromFild({
    Key? key,
    required this.controller,
    this.onChange, this.node,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 255.w,
          height:50.h,
          child: TextFormField(
            controller: controller,
            focusNode: node,
            onChanged: onChange,
            decoration: InputDecoration(
              hintText: "Search",
               // hintStyle: TextStyle(),
              filled: true,
                fillColor: Style.whiteColor,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100.r),),borderSide: BorderSide(color: Style.whiteColor)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100.r),),borderSide: BorderSide(color: Style.whiteColor)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100.r),),borderSide: BorderSide(color: Style.whiteColor)),
                suffixIcon:Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Style.whiteColor),
                    boxShadow: [
                      BoxShadow(
                          color:Style.greyColor,
                          blurRadius: 7,
                          spreadRadius:1,
                          offset: Offset(-3,2)
                      )
                    ]
                  ),
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: Style.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.mic,color: Style.blackColor,),
                    ),
                  ),
                ),
                prefixIcon:Icon(Icons.search,color: Style.blackColor,),
            ),
          ),
        ),
        15.horizontalSpace,
        Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Style.greyColor),
              boxShadow: [
                BoxShadow(
                    color:Style.greyColor,
                    blurRadius: 7,
                    spreadRadius:1,
                    offset: Offset(-3,2)
                )
              ]
          ),
          child: Container(
              width: 50.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Style.whiteColor,
    shape: BoxShape.circle,),
            child: IconButton(
              onPressed: (){},
              icon: icon,
            ),
          ),
        ),
      ],
    );
  }
}
