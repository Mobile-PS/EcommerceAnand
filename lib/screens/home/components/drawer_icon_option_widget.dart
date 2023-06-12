import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';


class DrawerIconOptionWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  const DrawerIconOptionWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
