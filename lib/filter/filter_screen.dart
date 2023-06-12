import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/filter/accept_bottom_navigation.dart';
import 'package:shop_app/filter/body.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/components/drawer_widget.dart';
import 'package:shop_app/screens/home/components/icon_btn_with_counter.dart';


class FilterScreen extends StatefulWidget {
  static String routeName = "/filter";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
            },
          )),
      body: Body(),
      bottomNavigationBar: AcceptBottomNavigation(
        onApply: () {
         // Navigator.of(context).pop(rules);
        },
      ),
    );
  }
}
