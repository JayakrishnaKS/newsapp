import 'package:flutter/material.dart';
import 'package:news_app/controller/bottom.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MaterialApp(home: bottom(),));
}
class bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Provider.of<BottomNavController>(context, listen: false)
              .selectedIndex,
          onTap: Provider.of<BottomNavController>(context).onItemTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: '')
          ]),
    );
  }
}
