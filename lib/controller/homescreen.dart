import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/newsmodel.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart'as http;

class homescreencontroller extends ChangeNotifier{
   late NewsModel newsModel;
  bool isLoading=false;
    fetchData() async{
    isLoading=true;
    notifyListeners();
    final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=87483ab3afc24e678268b418ce7775e0");
    final response=await http.get(url);
    print(response.statusCode);
    Map<String,dynamic>decodedData={};
    if(response.statusCode==200){
      decodedData=jsonDecode(response.body);
    }else{
      print("Api failed");
    }
    newsModel=NewsModel.fromJson(decodedData);
    isLoading=false;
    notifyListeners();
    
  } Future<void> launchURL(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
    notifyListeners();
  }

  void shareText({required String textToShare}) {}

}