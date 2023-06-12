import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/profile_page_controller.dart';
import 'package:shop_app/utilities/common.dart';


class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  var currentSelectedValue;
  final con = Get.put(ProfilePageController());
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {

    con.init(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(builder: (_)
    {
      return Scaffold(
          body: Stack(children: <Widget>[

            SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  Form(
                    key: _formKey,
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        SizedBox(height: 50,),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: Color.fromRGBO(65, 64, 66, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              fontFamily: 'Nunito Sans'),
                        ),
                        SizedBox(height: 20.0),
                        new TextFormField(
                          controller: con.fullnameController,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Full name',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        new TextFormField(
                          controller: con.emailController,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Email',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        new TextFormField(
                          controller: con.phoneController,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Phone',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        new TextFormField(
                          controller: con.addressController,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Address',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        new TextFormField(
                          controller: con.passwordnameController,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        SizedBox(
                            height: 62,
                            child: ElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState!.validate()) {
                                  con.UpdateProfile();
                                }
                                else{
                                  showSnackbar("All field are mendatory");
                                }
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color.fromRGBO(196, 196, 196, 1),
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(10))))
                            )),
                        SizedBox(height: 10.0),
                      ],
                    ),
                    )
                  ),
                )
            )
          ]));
    });
  }
}
