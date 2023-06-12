import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/constants.dart';


class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        title: Row(
          children: <Widget>[
            const Text(
              "Follow us",
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                },
                child: SocalCard(
                  icon: "assets/icons/google-icon.svg",
                  press: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                },
                child:  SocalCard(
                  icon: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                },
                child:  SocalCard(
                  icon: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
