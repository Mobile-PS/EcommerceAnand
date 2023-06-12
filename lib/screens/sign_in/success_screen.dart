import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up/components/body1.dart';

import 'components/body.dart';

class SucessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: Body1(),
    );
  }
}
