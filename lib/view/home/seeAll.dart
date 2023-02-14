import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/Home_controller.dart';
import '../component/custom_product.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return state.isProductLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.listOfProduct.length,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            itemBuilder: (context, index) {
              return CustomProductItem(
                product: state.listOfProduct[index],
                index: index,
                isLike: () {
                  event.changeLike(index: index);
                },
              );
            });
  }
}
