import 'package:flutter/material.dart';

import '../../../constants/loader.dart';
import '../../../models/Product.dart';
import '../../Account/Widget/SingleProduct.dart';
import '../../admin/services/admin_sevices.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: products!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final productData = products![index];
            return Column(
              children: [
                SizedBox(
                  height: 132,
                  child: SingleProduct(
                    image: productData.images[0],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          productData.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),

    );
  }
}
