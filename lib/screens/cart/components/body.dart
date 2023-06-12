import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/cart_screen_controller.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/utilities/progress_widget.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final con = Get.put(CartScreenController());


  @override
  void initState() {

     Future.delayed(const Duration(seconds: 1), () => con.ViewProduct());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CartScreenController>(builder: (_)
    {
      if(con.loading){
        return
          Center(child: ProgressBarWidget());
      }
      else {
        return Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView.builder(
            itemCount: con.loginScreenResponse != null?con.loginScreenResponse?.cartDetails?.length:0,
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child:CartCard(cart: con.loginScreenResponse!.cartDetails![index].product!,onpres: (){

                    con.DeleteProduct(con.loginScreenResponse!.cartDetails![index].cdCartId.toString(),index);
                  },)

                  /*Dismissible(
                    key: Key(demoCarts[index].product.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      *//*setState(() {
                demoCarts.removeAt(index);
              });*//*
                    },
                    background: Container(
                      color: Colors.green,
                      child: Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            Text(
                              " WishList",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      child: Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            Text(
                              " Remove",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    child: CartCard(cart: con.loginScreenResponse!.products![index]),
                  ),*/
                ),
          ),
        );
      }
    });
  }
}
