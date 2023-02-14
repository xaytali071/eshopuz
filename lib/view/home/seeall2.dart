import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopuz/view/home/inProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../addPage/addModel.dart';
import '../style.dart';

class SeeAll extends StatefulWidget {
  SeeAll({Key? key}) : super(key: key);

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  bool isLoading=true;
  @override
  final FirebaseFirestore fireStore=FirebaseFirestore.instance;
  List<ProductModel> list=[];
  List listOfDoc=[];
  QuerySnapshot? data;
  Future<void> getInfo({String? text}) async {
    isLoading = true;
    setState(() {});
    if(text == null){
      data = await fireStore.collection("product").get();
    }else{
      data = await fireStore
          .collection("product")
          .orderBy("title")
          .startAt([text]).endAt(["$text\uf8ff"]).get();
    }
    list.clear();
    listOfDoc.clear();
    data?.docs.forEach((element) {
      list.add(ProductModel.fromJson(element));
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
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: (){
                //  Navigator.push(context, MaterialPageRoute(builder: (_)=>));

                },
                child: Container(
                  width: 325.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Style.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 110.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            color: Style.oneColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(24),bottomLeft: Radius.circular(24)),
                            image: DecorationImage(
                                image: NetworkImage("${list[index].image}"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          5.verticalSpace,
                          SizedBox(
                              width: 170,
                              child: Text("${list[index].title}",style: Style.textStyleRegular(),maxLines:1,overflow: TextOverflow.ellipsis,)),
                          SizedBox(
                              width: 170,
                              child: Expanded(child: Text("${list[index].desc}",style: Style.textStyleNorm(textColor: Style.darkGreyColor,size: 10),maxLines:2,overflow: TextOverflow.ellipsis,))),
                          Text("\$${list[index].price}",style: Style.textStyleAuth(),),
                          5.verticalSpace,
                        ],

                      ),
                      IconButton(onPressed: ()async{
                        list[index].isLike != list[index].isLike;
                        fireStore.collection("product").doc().update({"isLike": "true"}).then((value) => print("${list[index].isLike}"));
                        setState(() {});
                      },icon:list[index].isLike==false ? Icon(Icons.favorite_border) :Icon(Icons.favorite) ,),

                    ],
                  ),
                ),
              ),
              10.verticalSpace,
            ],
          );
        });
  }
}