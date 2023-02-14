import 'package:eshopuz/model/product_model.dart';
import 'package:eshopuz/view/component/custom_product.dart';
import 'package:eshopuz/view/home/likePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/home_controller.dart';
import '../style.dart';

class FavouriteScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final List<ProductModel> state;
  // ignore: prefer_typing_uninitialized_variables
  final event;
  const FavouriteScreen({Key? key, required this.state, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.primaryColor,
        title: Text(
          "Favourite",
          style: Style.textStyleNorm(textColor: Style.whiteColor, size: 22),
        ),
      ),
      body: state.isEmpty
          ? Column(
              children: [
                (MediaQuery.of(context).size.width ~/ 5).toInt().verticalSpace,
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 7,
                      right: MediaQuery.of(context).size.width / 3),
                  child: Image.asset("assets/images/favourite.png"),
                ),
                Text(
                  "Not found",
                  style: Style.textStyleNorm(),
                )
              ],
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.length,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              itemBuilder: (context, index) {
                return CustomProductItem(
                  product: state[index],
                  index: index,
                  isLike: () {
                  },
                );
              }),
    );
  }
}
