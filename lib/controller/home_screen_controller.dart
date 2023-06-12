import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/api/apis.dart';
import 'package:shop_app/models/DrawerDataModel.dart';
import 'package:shop_app/models/SearchDataModel.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/utilities/common.dart';





class HomeScreenController extends GetxController {

   ProductModel? loginScreenResponse;

   DrawerDataModel? drawerDataModel;

   SearchDataModel? loginScreenResponse1;


   bool loading = false;
  TextEditingController emailtxtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 // final pref = PrefRepository();

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
     DrawerData();
   }

   /*void move(String test) {
    if(test.trim() == 'CT SCAN')
     Get.to(MRIServiceScreen(id: 8,));

   }*/


   Future<List<Products>> SearchData(String text) async {
     // toggleLoading();
     final response = await Apis().Search(text);

     printLog(response);

     if (response != null) {
       loginScreenResponse1 = response;
       //  pref.clearPreferences();
       // pref.saveUserData(loginScreenResponse!.data);
     }
     else{
       if (response != null)
         showSnackbar('Login Fail');

     }

     //  toggleLoading();
     update();
     return loginScreenResponse1!.products!;
   }



   Future<ProductModel?> ViewProduct() async {
     toggleLoading();


     final response = await Apis().getAllProduct();

     printLog(response);

     if (response != null) {
       loginScreenResponse = response;
       //  pref.clearPreferences();
       // pref.saveUserData(loginScreenResponse!.data);

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


   Future<DrawerDataModel?> DrawerData() async {
     toggleLoading();


     final response = await Apis().getDrawerData();

     printLog(response);

     if (response != null) {
       drawerDataModel = response;
       //  pref.clearPreferences();
       // pref.saveUserData(loginScreenResponse!.data);
       ViewProduct();
     //  showSnackbar('Data Fetch');
     }
     else{
       if (response != null)
         showSnackbar('Fail');

     }

     toggleLoading();
     update();
     return drawerDataModel;
   }



   Future<ProductModel?> AddToCartProduct(int productId,int qut,String usename) async {
     toggleLoading();


     final response = await Apis().AddtoCart(productId,qut,usename);

     printLog(response);

     if (response != null) {
       loginScreenResponse = response;
       //  pref.clearPreferences();
       // pref.saveUserData(loginScreenResponse!.data);

       Get.back();
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

}
