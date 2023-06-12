import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/cart/components/wishlist_card.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class WishlistBody extends StatefulWidget {
  @override
  _WishlistBody createState() => _WishlistBody();
}

class _WishlistBody extends State<WishlistBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
           // direction: DismissDirection.endToStart,
            onDismissed: (direction) {
             /* setState(() {
                demoCarts.removeAt(index);
              });*/
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
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    Text(
                      " Add",
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
            child: WishlistCard(cart: demoCarts[index]),
          ),
        ),
      ),
    );
  }
}
