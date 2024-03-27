import 'package:flutter/material.dart';
import 'package:news_app/apinewsssss/View/categoryscreen.dart';
import 'package:news_app/apinewsssss/View/homescreen.dart';
import 'package:news_app/apinewsssss/View/searchscreen.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    CAtegoryScreen(),
    SearchScreen()
  ];

// @override
// void notifyListeners() {
//   // TODO: implement notifyListeners
//   super.notifyListeners();
// }
}