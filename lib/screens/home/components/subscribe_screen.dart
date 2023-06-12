import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/oil.jpeg",
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(18.0, 40.0, 18.0, 18.0),
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 10, 0),
                child: Text(
                  subscribeDesc1,
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 10, 0),
                child: Text(
                  subscribeDesc1,
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
