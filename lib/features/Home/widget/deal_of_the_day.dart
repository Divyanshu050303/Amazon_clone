
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/Account/Widget/SingleProduct.dart';

import '../../../constants/loader.dart';
import '../../../models/Product.dart';
import '../../admin/services/admin_sevices.dart';
import '../../product_details/screen/productDetailScreen.dart';
import '../Service/HomeServices.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();
  List<Product>? products;
  final AdminServices adminServices = AdminServices();





  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
    fetchAllProducts();
  }
  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
        ? const SizedBox()
        : GestureDetector(
      onTap: navigateToDetailScreen,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.network(
            product!.images[0],
            height: 235,
            fit: BoxFit.fitHeight,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child:   Text(
              product!.price.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding:
            const EdgeInsets.only(left: 15, top: 5, right: 40),
            child:   Text(
              product!.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: product!.images
                  .map(
                    (e) => Image.network(
                  e,
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100,
                ),
              )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              'See all deals',
              style: TextStyle(
                color: Colors.cyan[800],
              ),
            ),
          ),
           

        ],
      ),
    );
  }
}