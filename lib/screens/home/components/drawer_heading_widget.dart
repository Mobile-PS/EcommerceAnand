import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class DrawerHeadingWidget extends StatelessWidget {
  final String heading;

  const DrawerHeadingWidget({Key? key, required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 28.0,
        child: ListTile(
          title: Text(
            heading,
            style: const TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
