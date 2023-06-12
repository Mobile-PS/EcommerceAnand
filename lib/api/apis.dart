import 'dart:convert';




import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/models/DrawerDataModel.dart';
import 'package:shop_app/models/SearchDataModel.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/models/orderListModel.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/utilities/common.dart';




import 'constants.dart';

class Apis {
  final constant = ApiConstants();
  final utils = ApiUtils();



  Future<ProductModel?> getAllProduct() async {

    final request = utils.createGetRequest(
        constant.productListUrl());


    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return ProductModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<SearchDataModel?> Search(String keyword) async {


    Map<String, String> params = {
      'productName': keyword,
    };



    final request = utils.createGetRequestWithParams(
        constant.getSearchUrl(),params);


    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return SearchDataModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }



  Future<OrderListModel?> getAllOrders(String custId) async {

    Map<String, String> params = {
      'customerId': custId,
    };

    final request = utils.createGetRequestWithParams(
        constant.getOrderUrl(),params);


    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return OrderListModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<DrawerDataModel?> getDrawerData() async {

    final request = utils.createGetRequest(
        constant.drawerListUrl());


    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return DrawerDataModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<CartModel?> getCartProduct(String userid) async {

    Map<String, String> params = {
      'userId': userid,
    };

    final request = utils.createGetRequestWithParams(
        constant.getCartUrl(),params);



    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return CartModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<CartModel?> getDeleteProduct(String cdid) async {



    final request = utils.createDeleteRequest(
        constant.deleteCartUrl()+'/$cdid');



    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return CartModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }



  Future<CartModel?> getCheckoutProduct(String cdid,String total) async {


    final request = utils.createPostRequest(
        constant.checkoutCartUrl()+'?cartId=$cdid');

    request.body = json.encode({
      "shipping_address" : "214, Bandra, mumbai - 440012",
      "order_date" : "2022-08-15 20:11:20",
      "shipping_date" : "2022-08-16 20:11:20",
      "payment_mode" : "Online",
      "transaction_id" : "T003",
      "shipping_pay" : total
    });

     request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return CartModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<ProductModel?> AddtoCart(int productId,int qut,String username) async {


    Map<String, String> params = {
      'productId': '$productId',
      'quantity': '$qut',
      'userId': username,
    };


    final request = utils.createPostRequestWithParams(
        constant.productAddToCartUrl(),params);



    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return ProductModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<LoginModel?> getLogin(String username, String password) async {

    Map<String, String> params = {
      'username': username,
      'password': password,

    };

    final request = utils.createGetRequestWithParams(
        constant.getLoginUrl(),params);



    // request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return LoginModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<LoginModel?> updateProfile(String userid,String name,
      String username, String password,String role,String age,String addr,String city,
      String phone) async {



    Map<String, String> params = {
      "id": userid,
      "name": name,
      "username": username,
      "password": password,
      "role": role,
      "age": age,
      "address": addr,
      "city": city,
      "country": "India",
      "phoneNo": phone,
      "active": 'true'

    };

    final request = utils.createPutRequest(
        constant.updateUrl()+'/'+userid);

    request.body = json.encode({
      "id": userid,
      "name": name,
      "username": username,
      "password": password,
      "role": role,
      "age": age,
      "address": addr,
      "city": city,
      "country": "India",
      "phoneNo": phone,
      "active": true
    });

     request.headers.addAll(constant.getHeader());

    printLog(request.body);

    http.StreamedResponse response = await request.send();
    printLog(response.statusCode);

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return LoginModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<LoginModel?> getSignup(String name,String username, String password,String address,String city,String country, String phone) async {


    final request = utils.createPostRequest(
        constant.getSignUpUrl());

    request.body = json.encode({
      "name" : name,
      "username" : username,
      "password" : password,
      "role" : "user",
      "age" : 23,
      "address" : address,
      "city" : city,
      "country" : country,
      "phoneNo" : phone

    });


     request.headers.addAll(constant.getHeader());

    printLog(request.body);
    http.StreamedResponse response = await request.send();

    printLog(response.statusCode);

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        Get.back();
        return null;
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }




}
