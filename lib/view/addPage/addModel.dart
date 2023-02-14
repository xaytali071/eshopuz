import 'package:cloud_firestore/cloud_firestore.dart';
class ProductModel{
  final String title;
  final String desc;
  final num price;
  final String? image;
  final bool? isLike;
  final String? category;
  ProductModel({ required this.title,required this.desc,required this.price,this.image,required this.isLike,required this.category});

  factory ProductModel.fromJson(QueryDocumentSnapshot data){
    return ProductModel(title: data["title"],desc: data["desc"], price: data["price"],image: data["image"],isLike: data["isLike"],category: data["category"]);
  }
  toJson() {
    return {"title": title, "desc": desc, "price": price,"image":image,"isLike":isLike,"category":category};
  }
}
class UpDateModel {
  final bool isLike;
  UpDateModel({required this.isLike});
  factory UpDateModel.fromJson(QueryDocumentSnapshot data){
    return UpDateModel(isLike: data ["isLike"]);
  }
  toJson(){
    return {"isLike":isLike};
  }
}
class CategoryModel{
  final String? name;
  final String? image;
  CategoryModel({required this.name,required this.image});
  factory CategoryModel.fromJson(QueryDocumentSnapshot data){
    return CategoryModel(name: data["name"], image: data["image"]);
  }
  toJson(){
    return {"name":name,"image":image};
  }
}

class BannerModel{
  final String? sale;
  final String? image;
  final String? sname;
  final String? date;

  BannerModel({required this.sale,required this.image,required this.sname,required this.date});
  factory BannerModel.fromJson(QueryDocumentSnapshot data){
    return BannerModel(sale: data["sale"], image: data["image"], sname: data["sname"], date: data["date"]);
  }
  toJson(){
    return {"sale":sale,"image":image,"sname":sname,"date":date};
  }

}
