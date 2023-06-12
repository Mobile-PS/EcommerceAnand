import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/home_screen_controller.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/drawer_heading_widget.dart';
import 'package:shop_app/screens/home/components/drawer_hearder_widget.dart';
import 'package:shop_app/screens/home/components/drawer_icon_option_widget.dart';
import 'package:shop_app/screens/home/components/drawer_option_widget.dart';
import 'package:shop_app/screens/home/components/get_in_touch_screen.dart';
import 'package:shop_app/screens/home/components/social_icon_widget.dart';
import 'package:shop_app/screens/home/components/subscribe_screen.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DeleteWidgetState createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DrawerWidget> {

  final con = Get.put(HomeScreenController());

  List<String> _days = ['Brands','Car Spares','Bike Spares','Accessories', 'Audio & Navigation', 'Auto Essential','Maintaince & Care','Spares Parts'];
  List<Cars> dummyData = [
    Cars(
      model: 'Fiat',
      speed: '100',
      day: 'Brands',
    ),
    Cars(
      model: 'Maruti',
      speed: '120',
      day: 'Brands',
    ),
    Cars(
      model: 'Hyundai',
      speed: '130',
      day: 'Brands',
    ),
    Cars(
      model: 'Toyota',
      speed: '140',
      day: 'Brands',
    ),
    Cars(
      model: 'Brake',
      speed: '100',
      day: 'Car Spares',
    ),
    Cars(
      model: 'Filter',
      speed: '120',
      day: 'Car Spares',
    ),
    Cars(
      model: 'Spark plug',
      speed: '130',
      day: 'Car Spares',
    ),
    Cars(
      model: 'Plug',
      speed: '140',
      day: 'Car Spares',
    ),
    Cars(
      model: 'Brake',
      speed: '140',
      day: 'Bike Spares',
    ),
    Cars(
      model: 'Filter',
      speed: '140',
      day: 'Bike Spares',
    ),
    Cars(
      model: 'Spark plug',
      speed: '140',
      day: 'Bike Spares',
    ),

    Cars(
      model: 'Brake',
      speed: '140',
      day: 'Accessories',
    ),
    Cars(
      model: 'Filter',
      speed: '140',
      day: 'Accessories',
    ),
    Cars(
      model: 'Spark plug',
      speed: '140',
      day: 'Accessories',
    ),
    Cars(
      model: 'Brake',
      speed: '140',
      day: 'Audio & Navigation',
    ),
    Cars(
      model: 'Filter',
      speed: '140',
      day: 'Audio & Navigation',
    ),
    Cars(
      model: 'Spark plug',
      speed: '140',
      day: 'Audio & Navigation',
    ),
    Cars(
      model: 'Brake',
      speed: '140',
      day: 'Auto Essential',
    ),
    Cars(
      model: 'Filter',
      speed: '140',
      day: 'Auto Essential',
    ),
    Cars(
      model: 'Spark plug',
      speed: '140',
      day: 'Auto Essential',
    ),
    Cars(
      model: 'Brake',
      speed: '140',
      day: 'Maintaince & Care',
    ),
    Cars(
      model: 'Filter',
      speed: '140',
      day: 'Maintaince & Care',
    ),
    Cars(
      model: 'Spark plug',
      speed: '140',
      day: 'Maintaince & Care',
    ),
    Cars(
      model: 'Brake',
      speed: '140',
      day: 'Spares Parts',
    ),
    Cars(
      model: 'Filter',
      speed: '140',
      day: 'Spares Parts',
    ),
    Cars(
      model: 'Spark plug',
      speed: '140',
      day: 'Spares Parts',
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return Drawer(
       child: Column(children: [
         const DrawerHeadingWidget(heading: 'My collections'),
        Expanded(
          child:
       ListView.builder(
           scrollDirection: Axis.vertical,
           shrinkWrap: true,
           itemCount: con.drawerDataModel?.categoriesWrapper?.length,
           itemBuilder: (_, index)
           {
             return ExpansionTile(
                 trailing:
                 Icon(
                   Icons.add,
                   color: Colors.black,
                   size: 20,
                 ),
                 title: Text(con.drawerDataModel!.categoriesWrapper![index].categoryName!),
                 children: [
                   ...con.drawerDataModel!.categoriesWrapper![index].subCategoriesList!.map((e) {
                     if (e.categoryId == con.drawerDataModel!.categoriesWrapper![index].id) {

                       return ExpansionTile(
                           trailing:
                           Icon(
                             Icons.add,
                             color: Colors.black,
                             size: 20,
                           ),
                           title: Text(con.drawerDataModel!.categoriesWrapper![index].subCategoriesList![index].category.toString()),
                          children: [
                            ...con.drawerDataModel!.categoriesWrapper![index].subCategoriesList![index].subCategoriesProductList!.map((e) {
             if (e.categoryId == con.drawerDataModel!.categoriesWrapper![index].id) {
                return
                  InkWell(onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: ProductDetailsArguments(product: e),
                    );
                  },child:
                  Padding(padding: EdgeInsets.all(5),child:Text(e.productName.toString(),style: TextStyle(fontSize: 16,color: Colors.black),)));
             }
             return Container();

           }

           )],
                       );

                      // return Padding(padding: EdgeInsets.all(5),child:Text(e.model.toString(),style: TextStyle(fontSize: 16,color: Colors.black),));
                     }
                     return Container();
                   }).toList(),
                 ]);
           })),

       ],));


      /*child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 14),
          const DrawerHeaderWidget(),

          const DrawerHeadingWidget(heading: 'My collections'),
          DrawerIconOptionWidget(
            title: 'Saved Item',
            onTap: () async {

            },
          ),

          */ /* createDrawerBodyItem(
            path: ConstImage().shopping,
            text: 'My Shopping Lists',
            onTap: () {}),*/ /*

          const DrawerHeadingWidget(heading: 'AutoShield premium'),
          DrawerIconOptionWidget(
            title: 'Subscribe',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SubscribeScreen()),
              );
            },
          ),

          const DrawerHeadingWidget(heading: 'About'),
          DrawerOptionWidget(
            title: 'About Autoshield ',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SubscribeScreen()),
              );
            },
          ),
          DrawerOptionWidget(
            title: 'Share Autoshield App',
            onTap: () {

            },
          ),
          const DrawerHeadingWidget(heading: 'Contact us'),
          DrawerOptionWidget(
            title: 'Write to us',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GetInTouchScreen()),
              );

            }
          ),
          const SocialIconWidget(),
          const DrawerHeadingWidget(heading: 'Others'),
          DrawerIconOptionWidget(
              title: 'Logout',
              onTap: () => {

              }),
          ListTile(
            title: Center(
              child: Text(
                'App version 1.0',
                style: const TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),*/

  }
}

class Cars {
  String model;
  String speed;
  String day;
  Cars({required this.model, required this.day, required this.speed});
}
