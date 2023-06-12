import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/notification_card.dart';



class NotificationListScreen extends StatefulWidget {

  const NotificationListScreen({Key? key})
      : super(key: key);

  @override
  _NotificationListScreen createState() => _NotificationListScreen();
}

class _NotificationListScreen extends State<NotificationListScreen> {
  @override
  Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: Text(
                      'Notification',
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
                body: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 4),
                          child: NotificationCard(
                          ),
                        );
                      }),
                ));
          }
        }


