import 'package:flutter/material.dart';
import 'package:shop_app/filter/filter_screen.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchField(),
          SizedBox(width: 5,),
        /*  GestureDetector(onTap: () {
            Navigator.pushNamed(
              context,
              FilterScreen.routeName,
            );
          },
          child: Icon(Icons.filter_list_outlined,size: 35,),
    ),*/
         /* IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),*/
         /* IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),*/
        ],

    );
  }
}
