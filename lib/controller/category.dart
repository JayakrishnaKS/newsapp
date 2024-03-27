import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:http/http.dart'as http;

class CategoryController extends ChangeNotifier{
  List<String>categoryList=[
    "Business",
    "Entertainment",
    "General","Health",
    "Science","Sports",
    "Technology"
  ];
  String category="business";
  onTap({required int index}){
    
    category=categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }
late NewsModel newsModel;
  bool isLoading=false;
   fetchData() async{
     isLoading=true;
     notifyListeners();
     final url=Uri.parse(" https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=87483ab3afc24e678268b418ce7775e0");
     print(category);
     final response=await http.get(url);
     print(response.statusCode);
     Map<String,dynamic>decodedData={};
     if(response.statusCode==200){
       decodedData=jsonDecode(response.body);

     }else{
       print("Api Failed");
     }
     newsModel=NewsModel.fromJson(decodedData);
     isLoading=false;
     notifyListeners();
   }
}