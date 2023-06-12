import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/home/components/product_list_body.dart';

import 'components/body.dart';

class ProductListScreen extends StatelessWidget {
  static String routeName = "/productlist";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductListBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
