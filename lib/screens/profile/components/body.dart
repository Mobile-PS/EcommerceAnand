import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/preferences/pref_repository.dart';
import 'package:shop_app/screens/home/components/notification_list_screen.dart';
import 'package:shop_app/screens/home/components/order_screen.dart';
import 'package:shop_app/screens/home/components/profile.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _prefRepo = PrefRepository();




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    ),
                  }),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationListScreen(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "History",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderScreen(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              _prefRepo.clearPreferences();
              Get.offAll(HomeScreen());

            },
          ),
        ],
      ),
    );
  }
}
