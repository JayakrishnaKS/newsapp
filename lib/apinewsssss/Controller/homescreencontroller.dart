import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/apinewsssss/Model/newsmodell.dart';
import 'package:share_plus/share_plus.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;
  //var baseUrl = "https://newsapi.org/";

  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=87483ab3afc24e678268b418ce7775e0");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {}; // map for storing response body
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  // Function to launch a URL
  Future<void> launchURL(String url) async {
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
  } void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }}

  ///to share news

