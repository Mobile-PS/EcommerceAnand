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




class SignupPageController extends GetxController {


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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


  Future<LoginModel?> Signup() async {
    toggleLoading();

    _widgets?.startLoader();

    final response = await Apis().getSignup(nameController.text,usernameController.text, passwordnameController.text,addressController.text,cityController.text,countryController.text, phoneController.text);

    printLog(response);
    _widgets?.stopLoader();

    Get.back();

    if (response != null ) {
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
