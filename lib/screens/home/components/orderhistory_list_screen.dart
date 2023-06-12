import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/order_screen_controller.dart';
import 'package:shop_app/screens/home/components/ongoing_card_widget.dart';
import 'package:shop_app/screens/home/components/orderhistory_card_widget.dart';



class OrderHistoryListScreen extends StatefulWidget {


  const OrderHistoryListScreen({Key? key})
      : super(key: key);

  @override
  _OrderHistoryListScreen createState() => _OrderHistoryListScreen();
}

class _OrderHistoryListScreen extends State<OrderHistoryListScreen> {

  final con = Get.put(OrderScreenController());

  @override
  Widget build(BuildContext context) {

            return Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: con.completeorderList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 4),
                          child: OrderHistoryCardWidget(
                          ),
                        );
                      }),
                ));
          }
        }


