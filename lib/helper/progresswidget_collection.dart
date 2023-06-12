import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utilities/constants.dart';

class ProgressWidgetsCollection {
  BuildContext? context;
  BuildContext? dialogContext;

  ProgressWidgetsCollection(BuildContext sentContext) {
    context = sentContext;
  }

  startLoader() {
    return showDialog(
      context: context!,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (BuildContext context) {
        dialogContext = context;
        return WillPopScope(
            onWillPop: () async => false,
            child: Container(
              color: Colors.black.withOpacity(0.1),
              child: Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(kPrimaryRed))),
            ));
      },
    );
  }

  stopLoader() {
    Navigator.of(context!, rootNavigator: true).pop(context);
  }
}
