import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/product_model.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts1 extends StatelessWidget {

  final  List<Products>? products;

  const PopularProducts1({Key? key, this.products}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap : true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
        ),
        physics: ScrollPhysics(),
        itemCount: products?.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(product: products![index]);
        });


    /*  Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );*/
  }
}
