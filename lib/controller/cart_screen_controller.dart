import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/api/apis.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/preferences/pref_repository.dart';
import 'package:shop_app/screens/sign_in/success_screen.dart';
import 'package:shop_app/utilities/common.dart';





class CartScreenController extends GetxController {

  CartModel? loginScreenResponse;


   bool loading = false;
  TextEditingController emailtxtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final pref = PrefRepository();

 int total = 0;

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }



   @override
   Future<void> onInit() async {
   //  ViewProduct();
   }

   /*void move(String test) {
    if(test.trim() == 'CT SCAN')
     Get.to(MRIServiceScreen(id: 8,));

   }*/


  createDialogsuccess (BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child:
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10.0)), //this right here
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.0,),
                      Center(
                          child:
                          Padding(padding: EdgeInsets.only(left: 10,right: 10.0),
                              child:
                              Text(
                                'Transaction successfully',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
                              ))),

                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.only(left: 50,right: 50),
                          child:
                          DefaultButton(
                            press: () {
                              Get.to(SucessScreen());
                            },
                            text: 'Continue',
                          )),
                      SizedBox(height: 20.0,),

                    ],
                  ),
                ),
              ));
        });
  }

  createDialogfail (BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child:
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10.0)), //this right here
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.0,),
                      Center(
                          child:
                          Padding(padding: EdgeInsets.only(left: 10,right: 10.0),
                              child:
                              Text(
                                'Transaction fail',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
                              ))),

                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.only(left: 50,right: 50),
                          child:
                          DefaultButton(
                            press: () {
                              Get.back();
                            },
                            text: 'Retry',
                          )),
                      SizedBox(height: 20.0,),

                    ],
                  ),
                ),
              ));
        });
  }



   Future<CartModel?> ViewProduct() async {
     toggleLoading();

     var response1 = await pref.getLoginUserData();

     final response = await Apis().getCartProduct(response1!.userId.toString());

     printLog(response);

     if (response != null) {
       loginScreenResponse = response;
       //  pref.clearPreferences();
       // pref.saveUserData(loginScreenResponse!.data);

         total = loginScreenResponse!.cartDetails![0].cdAmount!.toInt();

       showSnackbar('Data Fetch');
     }
     else{
       if (response != null)
         showSnackbar('Fail');

     }

     toggleLoading();
     update();
     return loginScreenResponse;
   }

  Future<CartModel?> DeleteProduct(String id, int index) async {
    toggleLoading();

    loginScreenResponse!.cartDetails!.removeAt(index);

    var response1 = await pref.getLoginUserData();

    final response = await Apis().getDeleteProduct(id);

    printLog(response);

    if (response != null) {
      loginScreenResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);

      total = loginScreenResponse!.cartDetails![0].cdAmount!.toInt();

      showSnackbar('Data Fetch');
    }
    else{
      if (response != null)
        showSnackbar('Fail');

    }

    toggleLoading();
    update();
    return loginScreenResponse;
  }



  Future<dynamic> CheckoutCart(String cid) async {
    toggleLoading();


   // var response1 = await pref.getLoginUserData();

    final response = await Apis().getCheckoutProduct(cid,total.toString());

    printLog(response);

    if (response != null) {


      Get.to(SucessScreen());
     // loginScreenResponse = response;
      //  pref.clearPreferences();
      // pref.saveUserData(loginScreenResponse!.data);

    //  total = loginScreenResponse!.cartDetails![0].cdAmount!.toInt();

     // showSnackbar('Data Fetch');
    }
    else{
      if (response != null)
        showSnackbar('Fail');

    }

    toggleLoading();
    update();

  }

}
