import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopuz/view/component/costomGredview.dart';
import 'package:eshopuz/view/component/coutomTextFromFild.dart';
import 'package:eshopuz/view/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/Home_controller.dart';
import '../../model/categoryModel.dart';

class CategorePage extends StatefulWidget {
  const CategorePage({Key? key}) : super(key: key);

  @override
  State<CategorePage> createState() => _CategorePageState();
}

class _CategorePageState extends State<CategorePage> {
  TextEditingController controllerCategory=TextEditingController();
  @override


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().getCategory();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoustomTextFromFild(controller:controllerCategory , icon:Icon(Icons.add),),
              15.verticalSpace,
              Text("Categories",style: Style.textStyleAuth(size: 20),),
              15.verticalSpace,
              CustomGridwiew(),
            ],
          ),
        ),
      )
      ),
    );
  }
}
