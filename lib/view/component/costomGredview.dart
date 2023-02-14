import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eshopuz/view/home/categoryList.dart';
import 'package:eshopuz/view/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/Home_controller.dart';
import '../addPage/addModel.dart';

class CustomGridwiew extends StatefulWidget {
  const CustomGridwiew({Key? key}) : super(key: key);

  @override
  State<CustomGridwiew> createState() => _CustomGridwiewState();
}

class _CustomGridwiewState extends State<CustomGridwiew> {
  List<CategoryModel> list = [];

  List listOfDoc = [];
  List lst = [
    "auto",
    "musics",
    "fashion",
    "agroculture",
    "electronics",
    "digital Service"
  ];
  List<ProductModel> list1 = [];
  bool isLoading = true;
  List listOfCatgoryItem = [];
  QuerySnapshot? data;

  Future<void> getInfo({String? text}) async {
    isLoading = true;
    setState(() {});
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    data = await fireStore.collection("category").get();
    list.clear();
    listOfDoc.clear();
    data?.docs.forEach((element) {
      list.add(CategoryModel.fromJson(element));
      listOfDoc.add(element.id);
    });
    isLoading = false;
    setState(() {});
  }

  Future<void> getInfo1({String? text}) async {
    isLoading = true;
    setState(() {});
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    data = await fireStore.collection("product").get();
    list1.clear();
    listOfDoc.clear();
    data?.docs.forEach((element) {
      list1.add(ProductModel.fromJson(element));
      listOfDoc.add(element.id);
    });
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 220),
      shrinkWrap: true,
      itemCount: state.listOfCategory.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            event.getOneCategory(
                model: state.listOfCategory[index],
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => CategoryList(
                            product: state.listOfCategoryProduct,
                          )));
                });
          },
          child: Container(
            margin: index % 2 == 0
                ? EdgeInsets.only(right: 7, bottom: 15)
                : EdgeInsets.only(left: 7, bottom: 15),
            width: 155.w,
            height: 165.h,
            decoration: BoxDecoration(
                color: Style.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Column(
              children: [
                20.verticalSpace,
                Container(
                  width: 105.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                      color: Style.twoColor,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${state.listOfCategory[index].image}"))),
                ),
                15.verticalSpace,
                Text(
                  "${(state.listOfCategory[index].name?.substring(0, 1).toUpperCase() ?? '') + (state.listOfCategory[index].name?.substring(1) ?? '')}",
                  style: Style.textStyleRegular(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
