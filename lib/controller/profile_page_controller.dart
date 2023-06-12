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




class ProfilePageController extends GetxController {


  TextEditingController usernameController = TextEditingController();


  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordnameController = TextEditingController();

  final _prefRepo = PrefRepository();

  bool togggle = true;
  bool loading = false;
  LoginModel? loginScreenResponse;
  ProgressWidgetsCollection? _widgets;

  //initToast()




  @override
  Future<void> onInit() async {
    super.onInit();
    var token = await _prefRepo.getLoginUserData();

    fullnameController.text = token!.user!.name.toString();
    emailController.text = token.user!.email.toString();
    phoneController.text = token.user!.phoneNo.toString();
    addressController.text = token.user!.address.toString();
    passwordnameController.text = token.user!.password.toString();

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


  Future<LoginModel?> UpdateProfile() async {
   // toggleLoading();

    _widgets?.startLoader();



    var token = await _prefRepo.getLoginUserData();


    final response = await Apis().updateProfile(token!.user!.id.toString(),fullnameController.text,token.user!.username.toString(),
    passwordnameController.text,token.user!.role.toString(),token.user!.age.toString(),addressController.text,token.user!.city.toString(),
    phoneController.text);

    printLog(response);
    _widgets?.stopLoader();

    if (response != null) {
      loginScreenResponse = response;
      //  pref.clearPreferences();
     // _prefRepo.saveLoginData(loginScreenResponse!);

      Get.offAll(HomeScreen());
      showSnackbar('Profile Updated successfully');
    }
    else{
      if (response != null)
        showSnackbar('Fail');

    }

   // toggleLoading();
    update();
    return loginScreenResponse;
  }




}
