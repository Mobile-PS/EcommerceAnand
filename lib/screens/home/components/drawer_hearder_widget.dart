import 'package:flutter/material.dart';


class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/mainicon.jpeg'),
                    ))),
            SizedBox(height: 5.0),
           /* Align(
              alignment: Alignment.center,
              child: Text(
                'Rajeev Sri',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    fontFamily: 'Gelion'),
              ),
            ),*/

            ElevatedButton(
              onPressed: () {
                 // Get.to(EditProfile());
              },
              child: Text(
                "My Profile",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),

              style: ButtonStyle(

              shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder(
                  side: BorderSide(color: Colors.black, width: 1))),
            ))

          ],
        ));
  }
}
