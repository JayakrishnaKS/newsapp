import 'package:flutter/material.dart';
import 'package:news_app/apinewsssss/Controller/bottom_nav_controller.dart';
import 'package:news_app/apinewsssss/Controller/categorycontroller.dart';
import 'package:news_app/apinewsssss/Controller/homescreencontroller.dart';
import 'package:news_app/apinewsssss/Controller/searchscreencontroller.dart';
import 'package:news_app/apinewsssss/View/bottomnav.dart';


import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryController(),
        )
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}