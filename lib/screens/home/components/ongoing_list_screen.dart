import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/order_screen_controller.dart';
import 'package:shop_app/screens/home/components/ongoing_card_widget.dart';
import 'package:shop_app/utilities/progress_widget.dart';



class OngoingListScreen extends StatefulWidget {


  const OngoingListScreen({Key? key})
      : super(key: key);

  @override
  _OngoingListScreen createState() => _OngoingListScreen();
}

class _OngoingListScreen extends State<OngoingListScreen> {
  final con = Get.put(OrderScreenController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
            return Scaffold(
                backgroundColor: Colors.white,
                body: Column(children: [
                GetBuilder(
                init: con,
                builder: (context) {
              if (con.loginScreenResponse == null) {
                return Center(child: ProgressBarWidget());
              } else {
               return
                   Expanded(child:
                   ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: con.loginScreenResponse!.orders!.length > 0?con.loginScreenResponse!.orders!.length:0,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 4),
                          child: OngoingCardWidget(
                            orders: con.loginScreenResponse!.orders![index],
                          ),
                        );
                      }),
                );
              }}

    )],));


          }
        }


