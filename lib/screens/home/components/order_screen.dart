import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/ongoing_list_screen.dart';
import 'package:shop_app/screens/home/components/orderhistory_list_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'History',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  height: 50.0,
                  child: TabBar(
                    labelColor: Colors.grey,
                    indicatorColor: Colors.deepOrangeAccent,
                    tabs: [
                      Tab(
                        child: Text(
                          'Running',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'History',
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )),
            body: TabBarView(
              children: [
                OngoingListScreen(),
                OrderHistoryListScreen(),
              ],
            ),
          ),
        ));
  }
}
