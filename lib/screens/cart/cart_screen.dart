import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/cart_screen_controller.dart';
import 'package:shop_app/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final con = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartScreenController>(builder: (_)
    {
      return Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
        bottomNavigationBar: CheckoutCard(),
      );
    });
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          con.loginScreenResponse?.cartDetails != null?
          Text(
            "${con.loginScreenResponse?.cartDetails!.length} Items",
            style: Theme.of(context).textTheme.caption,
          ): Text(
            "0 Items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
