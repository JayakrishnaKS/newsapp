import 'package:flutter/material.dart';


import 'package:news_app/view/categoryscreen/category_screen.dart';
import 'package:news_app/view/search_screen/search_screen.dart';

import '../view/homescreen/home_screen.dart';

class BottomNavController extends ChangeNotifier{
  int selectedIndex=0;
  void onItemTap(index){
    selectedIndex=index;
    notifyListeners();
  }
  List<Widget>myPages=[HomeScreen(),CategoryScreen(),SearchScreen()];
}