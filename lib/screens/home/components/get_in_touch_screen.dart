import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';


class GetInTouchScreen extends StatelessWidget {
  const GetInTouchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _messageController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/oil.jpeg",
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(18.0, 40.0, 18.0, 18.0),
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Get in touch!',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text(
                        getinTouchDesc,
                        style: const TextStyle(
                          color: kSecondaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: _messageController,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: enterYourMessage,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:  BorderSide(
                              color: kSecondaryColor,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:  BorderSide(
                              color: kSecondaryColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          sentMessage,
                          style: const TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 80,
                          ),
                          backgroundColor: kPrimaryColor,
                          shape: const StadiumBorder(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
