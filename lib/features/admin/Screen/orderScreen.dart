
import 'package:flutter/material.dart';

import '../../../constants/loader.dart';
import '../../../models/order.dart';
import '../../Account/Widget/SingleProduct.dart';
import '../../orderDetails/screen/orderDetailsScreen.dart';
import '../services/admin_sevices.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
      itemCount: orders!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        final orderData = orders![index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              OrderDetailScreen.routeName,
              arguments: orderData,
            );
          },
          child: SizedBox(
            height: 140,
            child: SingleProduct(
              image: orderData.products[0].images[0],
            ),
          ),
        );
      },
    );
  }
}