import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/home_screen_controller.dart';
import 'package:shop_app/models/SearchDataModel.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/popular_product1.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/screens/home/product_list_screen.dart';
import 'package:shop_app/utilities/common.dart';
import 'package:shop_app/utilities/progress_widget.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final con = Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
           // HomeHeader(),
            GestureDetector(
              onTap: () {},
              child:
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    )
                  ],
                ),
                child:
                Row(
                  children: [
                    const SizedBox(width: 5),
                    Icon(Icons.search,size: 18),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          // controller: profileCtrl.skillcontroller,
                          cursorColor: Colors.black54,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Search product here',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                                fontFamily: 'Nunito Sans'),
                          ),
                        ),
                        suggestionsCallback: (pattern) {
                          //  profileCtrl.getSkilldata("1.0", pattern);
                          //  return profileCtrl.skillList;
                          // return _dynamicChips;
                          return con.SearchData(pattern);
                        },
                        itemBuilder: (context, Products suggestion) {
                          return Container(
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(2),
                            child: SubstringHighlight(
                              text: suggestion.productName.toString(),
                              term: suggestion.productName != null?suggestion.productName:'',
                              textStyle: const TextStyle(
                                color: Colors.black54,
                              ),
                              textStyleHighlight: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        onSuggestionSelected: (Products suggestion) {
                          //  profileCtrl.updateSkill(suggestion);
                          //  profileCtrl.skillcontroller.clear();

                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(product: suggestion),
                          );

                         /* if(suggestion.subServiceId1 ==0) {

                            con.servID = suggestion.subServiceId;
                            con.subServId = suggestion.subServiceId1;
                            con.subServname = suggestion.subService;
                            con.servName = suggestion.subService;


                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SubServiceScreen1(id: suggestion.subServiceId),
                              ),
                            );
                          }else {
                            con.servID = suggestion.subServiceId;
                            con.subServId = suggestion.subServiceId1;
                            con.subServname = suggestion.subService;
                            con.servName = suggestion.subService;

                            Get.to(ServiceproviderScreen(
                                id: suggestion.subServiceId, mainid: suggestion.subServiceId1));
                          }*/

                          hideKeyBoard();
                        },
                      ),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: const Color.fromRGBO(200, 200, 200, 1),
                      child: IconButton(
                        onPressed: () {
                          // profileCtrl.skillcontroller.clear();
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                        },
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            // Categories(),
            // SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(10)),
            // PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(
                  title: "Product",
                  press: () {
                    /* Navigator.pushNamed(
                  context,
                  ProductListScreen.routeName,
                );*/
                  }),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),

            GetBuilder(
                init: con,
                builder: (context) {
                  if (con.loginScreenResponse == null) {
                    return Center(child: ProgressBarWidget());
                  } else {
                    return PopularProducts1(
                      products: con.loginScreenResponse?.products,
                    );
                  }
                }),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
