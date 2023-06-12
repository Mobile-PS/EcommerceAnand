import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/api/apis.dart';
import 'package:shop_app/helper/progresswidget_collection.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/preferences/pref_repository.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/utilities/common.dart';




class LoginPageController extends GetxController {


  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordnameController = TextEditingController();
  final _prefRepo = PrefRepository();

  bool togggle = true;
  bool loading = false;
  LoginModel? loginScreenResponse;
  ProgressWidgetsCollection? _widgets;

  //initToast()




  @override
  void onInit() {
    super.onInit();
  }


  void init(BuildContext context) {
    _widgets = ProgressWidgetsCollection(context);

  }

  void tooglePassword() {
    togggle = !togggle;
    update();
  }

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }


  Future<LoginModel?> Login() async {
    toggleLoading();

    _widgets?.startLoader();

    final response = await Apis().getLogin(usernameController.text,passwordnameController.text);

    printLog(response);
    _widgets?.stopLoader();

    if (response != null) {
      loginScreenResponse = response;
      //  pref.clearPreferences();
      _prefRepo.saveLoginData(loginScreenResponse!);

      Get.offAll(HomeScreen());
      showSnackbar('Login successfully');
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
