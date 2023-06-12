import 'package:flutter/material.dart';


class OrderHistoryCardWidget extends StatelessWidget {

  const OrderHistoryCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
       /* Get.to(
          () => ProductDetailsScreen(
            productId: products!.id!,
          ),
        );*/
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              elevation: 8.0,
             // color: cardBackgroundColor,
              child: Padding(padding: EdgeInsets.all(10),
              child:

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      'Order id : #10101108',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          fontFamily: 'Nunito Sans'),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Order title : Oil',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.0,
                          fontFamily: 'Nunito Sans'),
                    ),
                  const SizedBox(height: 5),
                  Text(
                    'Order Status : Deliver',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                        fontFamily: 'Nunito Sans'),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                    Container(
                      height: 40.0,
                      width: 80.0,

                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)),
                        border: Border.all(color: Colors.redAccent,width: 2.0)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('View'),
                        ],),
                    ),
                  ],),
                  SizedBox(height: 20,),

                ],
              )),
            ),

          ],
        ),
      ),
    );
  }
}
