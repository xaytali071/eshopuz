
import 'package:eshopuz/view/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/Home_controller.dart';

class Featured extends StatelessWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: state.listOfProduct.length,
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
                          image: DecorationImage(
                            image: NetworkImage("${state.listOfProduct[index].image}")
                          ),
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
                        child: Column(
                          children: [
                            Text("${state.listOfProduct[index].name}"),
                            Text("\$${state.listOfProduct[index].price}",style: Style.textStyleRegular2(),)
                          ],
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
