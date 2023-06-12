import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shop_app/controller/cart_screen_controller.dart';
import 'package:url_launcher/url_launcher.dart';


class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethod createState() => _PaymentMethod();
}

class _PaymentMethod extends State<PaymentMethod> {

  //final regCtrl = Get.put(CartScreenController());
   Razorpay? _razorpay;

   final con = Get.put(CartScreenController());


   @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  //  regCtrl.transid = response.orderId;
   // regCtrl.paymode= 'Online';

    con.CheckoutCart(con.loginScreenResponse!.cartDetails![0].cdCartId.toString());

    con.createDialogsuccess(context);

   // showSnackbar('"SUCCESS: " + ${response.paymentId}');

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
    con.createDialogfail(context);

   // showSnackbar('"SUCCESS: " + ${response.message}');

  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
    con.createDialogfail(context);

  //  showSnackbar('"SUCCESS: " + ${response.walletName}');

  }


  void openCheckout() async {
    var options = {
      'key': 'rzp_live_IE7BSCxo3G3OiL',
      'amount': (con.total) * 100,
      'name': 'ALF Auto Services Private.',
      'description': 'Auto Services ',
      "currency": "INR",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9922990002', 'email': 'alfauto@rediffmail.com'}
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*floatingActionButton: FloatingActionButton(
          onPressed: () async {

            await launch ("tel:+917080909046");

          },
          child: Icon(Icons.call, color: Colors.white, size: 29,),
          backgroundColor: Colors.blue,
          elevation: 5,
          splashColor: Colors.grey,
        ),*/
        appBar: AppBar(
            title: Text(
              'Payment Method',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            )),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Select Payment\nMethod",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 26.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 53,
                      width: 290.0,
                      child: ElevatedButton(
                        onPressed: () {
                         /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingConfirm(),
                            ),
                          );*/

                          openCheckout();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Online',
                                style: TextStyle(
                                  color: Color.fromRGBO(58, 58, 60, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                            Icon(Icons.arrow_forward_ios, color: Colors.black),
                          ],
                        ),
                          style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromRGBO(196, 196, 196, 1),
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)))),
                      )),
                  /*SizedBox(
                    height: 20,
                  ),*/
                 /* SizedBox(
                      height: 53,
                      width: 290.0,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingConfirm(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Net Banking',
                                style: TextStyle(
                                  color: Color.fromRGBO(58, 58, 60, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                            Icon(Icons.arrow_forward_ios, color: Colors.black),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromRGBO(196, 196, 196, 1),
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 53,
                      width: 290.0,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingConfirm(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Debit Card',
                                style: TextStyle(
                                  color: Color.fromRGBO(58, 58, 60, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                            Icon(Icons.arrow_forward_ios, color: Colors.black),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromRGBO(196, 196, 196, 1),
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                      )),*/
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 53,
                      width: 290.0,
                      child: ElevatedButton(
                        onPressed: () {

                          con.CheckoutCart(con.loginScreenResponse!.cartDetails![0].cdCartId.toString());

                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingConfirm(),
                            ),
                          );*/
                          //  Get.to(Payment());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cash',
                                style: TextStyle(
                                  color: Color.fromRGBO(58, 58, 60, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                            Icon(Icons.arrow_forward_ios, color: Colors.black),
                          ],
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromRGBO(196, 196, 196, 1),
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)))),
                      )),
                ],
              ),
            ),
          )
        ])));
  }
}
