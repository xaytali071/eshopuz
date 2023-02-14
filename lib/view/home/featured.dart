import 'package:eshopuz/view/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Featured extends StatelessWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder:(context,index){
            return Row(
              children: [
                10.horizontalSpace,
                Container(
                  width: 140.w,
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24))
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 140.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: Style.twoColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r),topRight: Radius.circular(24.r)),
                        ),
                      ),
                      Container(
                        width: 140.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Style.whiteColor,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.r),bottomRight: Radius.circular(24.r)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );

          }),
    );
  }
}
