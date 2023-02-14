 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../model/categoryModel.dart';
import '../model/product_model.dart';

class HomeController extends ChangeNotifier{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<CategoryModel> listOfCategory = [];
  List<ProductModel> listOfProduct = [];
  List<ProductModel> listOfCategoryProduct = [];
  List<ProductModel> listOfFavouriteProduct = [];
  bool isLoading = false;
  bool isCategoryLoading = false;
  bool isProductLoading = false;

  getCategory() async {
    isLoading = true;
    notifyListeners();
    var res = await firestore.collection("category").get();
    listOfCategory.clear();
    for (var element in res.docs) {
      listOfCategory.add(CategoryModel.fromJson(element.data(), element.id));
    }
    isLoading = false;
    notifyListeners();
  }

  getProduct({bool isLimit = true}) async {
      isProductLoading = true;
      notifyListeners();
   var res;
    if (isLimit) {
      res = await firestore.collection("product").limit(16).get();
    } else {
      res = await firestore.collection("product").get();
    }
    listOfProduct.clear();
    for (var element in res.docs) {
      listOfProduct
          .add(ProductModel.fromJson(data:element.data(),id: element.id));
    }
    isProductLoading = false;
    notifyListeners();
  }


  changeLike({required int index}) async {
      listOfProduct[index].isLike = !listOfProduct[index].isLike;
      notifyListeners();
      await firestore
          .collection("product")
          .doc(listOfProduct[index].id)
          .update((listOfProduct[index]).toJson());
    notifyListeners();
  }
  getFavourites() {
    // ignore: avoid_function_literals_in_foreach_calls
    listOfFavouriteProduct.clear();
    for (var element in listOfProduct) {
      element.isLike == true
          ? listOfFavouriteProduct.add(element)
          : element.isLike = false;
    }
    notifyListeners();
  }


  getOneCategory({required CategoryModel model, required VoidCallback onTap}) async {
    isCategoryLoading = true;
    notifyListeners();
    listOfCategoryProduct.clear();
    var res = await firestore
        .collection("product")
        .where("category", isEqualTo: model.name)
        .get();

    for (var element in res.docs) {
      listOfCategoryProduct
          .add(ProductModel.fromJson(data: element.data(), id: element.id));
    }
    onTap();
    isCategoryLoading = false;
    notifyListeners();
  }




}