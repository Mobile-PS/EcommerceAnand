import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/api/apis.dart';
import 'package:shop_app/models/DrawerDataModel.dart';
import 'package:shop_app/models/orderListModel.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/preferences/pref_repository.dart';
import 'package:shop_app/utilities/common.dart';





class OrderScreenController extends GetxController {

  OrderListModel? loginScreenResponse;

   DrawerDataModel? drawerDataModel;

   List<Orders> orderList = [];
  List<Orders> completeorderList = [];


   bool loading = false;
  TextEditingController emailtxtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final pref = PrefRepository();

   int cartCount= 0;


  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

   void updateCart(String type) {
     if(type == 'inc'){
       cartCount = cartCount + 1;
     }
     else{
       cartCount = cartCount - 1;
     }

     update();
   }


   @override
   Future<void> onInit() async {
     ViewProduct();
   }

   /*void move(String test) {
    if(test.trim() == 'CT SCAN')
     Get.to(MRIServiceScreen(id: 8,));

   }*/





   Future<OrderListModel?> ViewProduct() async {
     toggleLoading();


     var response1 = await pref.getLoginUserData();


     final response = await Apis().getAllOrders(response1!.userId.toString());

     printLog(response);

     if (response != null) {
       loginScreenResponse = response;
       //  pref.clearPreferences();
       // pref.saveUserData(loginScreenResponse!.data);

       completeorderList = loginScreenResponse!.orders!.where((element) => element.status == 'Complete').toList();

       showSnackbar('Data Fetch');
      // DrawerData();
     }
     else{
       if (response != null)
         showSnackbar('Fail');

     }

     toggleLoading();
     update();
     return loginScreenResponse;
   }



}
