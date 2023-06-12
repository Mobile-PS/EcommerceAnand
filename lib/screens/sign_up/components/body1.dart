import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/size_config.dart';

import 'sign_up_form.dart';

class Body1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/4,),
                Text("Order", style: headingStyle),
                Text(
                  "Order Place Successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                DefaultButton(
                  text: "Continue",
                  press: () {

                      Get.offAll(HomeScreen());

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
