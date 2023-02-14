import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopuz/view/addPage/addModel.dart';
import 'package:eshopuz/view/component/custom_image.dart';
import 'package:eshopuz/view/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerHome extends StatefulWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  State<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  int selindex=0;
  List<ProductModel> listOfProduct=[];
  bool isLoading=true;
  @override
  final FirebaseFirestore fireStore=FirebaseFirestore.instance;
  List<BannerModel> list=[];
  List listOfDoc=[];
  QuerySnapshot? data;
  Future<void> getInfo({String? text}) async {
    isLoading = true;
    setState(() {});
      data = await fireStore.collection("banner").get();
    list.clear();
    listOfDoc.clear();
    data?.docs.forEach((element) {
      list.add(BannerModel.fromJson(element));
      listOfDoc.add(element.id);
    });
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130.h,
          child: PageView.builder(
            onPageChanged: (s){
              selindex=s;
              setState(() {});
            },
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder:(context,index){

                return Container(
                  width: 315.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    gradient: Style.linearGradient,
                    borderRadius: BorderRadius.all(Radius.circular(24))
                  ),
                  child: Row(
                    children: [
                      20.horizontalSpace,
                      CustomImageNetwork(image: "${list[index].image}"),

                      15.horizontalSpace,
                      Column(
                        children: [
                          20.verticalSpace,
                          Text("${list[index].sale}%",style:Style.textStyleNorm(size: 30,textColor: Style.whiteColor),),
                          Text("${list[index].sname}",style: Style.textStyleAuth(size: 20,textColor:Style.whiteColor ),),
                          Text("${list[index].date}",style: Style.textStyleNorm(size: 10,textColor:Style.whiteColor ),),
                        ],
                      )
                    ],
                  ),
                );

              } ),
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
              width: 40.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder:(context,index){
                    return Container(
                      width: selindex ==index ? 20.w : 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: selindex ==index ? Style.primaryColor :Style.oneColor,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                    );
                  }),
            ),
          ],
        )
      ],
    );
  }
}
