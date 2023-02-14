import 'package:eshopuz/view/component/coutomTextFromFild.dart';
import 'package:eshopuz/view/home/banner.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/Home_controller.dart';
import '../component/custom_product.dart';
import 'featured.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<HomeController>().getProduct();
      // ignore: use_build_context_synchronously
      context.read<HomeController>().getFavourites();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return  SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            CoustomTextFromFild(
              controller: searchController,
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
            10.verticalSpace,
            const BannerHome(),
            10.verticalSpace,
            const Featured(),
            state.isProductLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: state.listOfProduct.length,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 18),
                itemBuilder: (context, index) {
                  print(state.listOfProduct[index].id);
                  return CustomProductItem(
                    product: state.listOfProduct[index],
                    index: index,
                    isLike: () {
                      event.changeLike(index: index);
                    },
                  );
                }),
            10.verticalSpace,
          ],
        )
    );
  }
}
