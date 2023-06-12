import 'package:flutter/material.dart';
import 'package:shop_app/api/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class CartCard extends StatelessWidget {

  Function onpres;
   CartCard({
    Key? key,
    required this.cart,
    required this.onpres
  }) : super(key: key);

  final Product cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(ApiConstants().imagebaseUrl+cart.id.toString()),fit: BoxFit.fill)
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              cart.productName!,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\₹${cart.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${cart.quantity}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )),
        Spacer(),
            GestureDetector(onTap: () {
              onpres();
            },child:
            Icon(
              Icons.delete,
              color: Colors.black,
              size: 18,
            )),
      ],
    );
  }
}
