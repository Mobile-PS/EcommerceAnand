import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/controller/details_screen_controller.dart';
import 'package:shop_app/controller/home_screen_controller.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/utilities/common.dart';
import 'package:shop_app/utilities/progress_widget.dart';

import '../../../preferences/pref_repository.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Products product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final con = Get.put(DetailsScreenController());
  final pref = PrefRepository();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsScreenController>(builder: (_)
    {
      return ListView(
        children: [
          ProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: widget.product),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child:
                          con.loading? Center(child: ProgressBarWidget()):
                          DefaultButton(
                            text: "Add To Cart",
                            press: () async {
                              var response1 = await pref.getLoginUserData();

                              if(response1?.userId != null) {
                                if (con.cartCount > 0) {
                                  con.AddToCartProduct(
                                      widget.product.id!, con.cartCount, '1');
                                } else {
                                  showSnackbar('please select quantity');
                                }
                              }else{
                                showSnackbar('please login and continue');
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
