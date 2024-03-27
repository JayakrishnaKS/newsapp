import 'package:flutter/material.dart';
import 'package:news_app/controller/bottom.dart';
import 'package:news_app/controller/category.dart';
import 'package:news_app/controller/homescreen.dart';
import 'package:news_app/controller/searchscreencontroller.dart';
import 'package:news_app/view/bottom_nav/Bottomnav.dart';
import 'package:provider/provider.dart';
void main(){
  runApp( MyApp(),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>homescreencontroller()),
      ChangeNotifierProvider(create: (context)=>SearchScreenController()),
      ChangeNotifierProvider(create: (context)=>BottomNavController()),
      ChangeNotifierProvider(create: (context)=>CategoryController()),

    ],child: MaterialApp(home: bottom(),),);
  }
}

// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//
//     );
//   }
//}

