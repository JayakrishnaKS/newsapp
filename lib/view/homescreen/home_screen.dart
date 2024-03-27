import 'package:flutter/material.dart';
import 'package:news_app/controller/homescreen.dart';
import 'package:news_app/view/search_screen/search_screen.dart';
import 'package:news_app/view/widgets%20screen/new_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Provider.of<homescreencontroller>(context).fetchData();
  }

  @override

    Widget build(BuildContext context) {
      homescreencontroller provider = Provider.of<homescreencontroller>(context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6A3DE8),
          elevation: 0,
          title: const Text(
            "News Today 🗞️",
          ),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20,
              fontWeight: FontWeight.w600),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: Provider.of<homescreencontroller>(context).isLoading == true
            ? Center(
            child: CircularProgressIndicator()
            )
            : Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
              itemBuilder: (context, index) => NewsCard(
                title: provider.newsModel.articles?[index].title
                    .toString() ?? "",
                description: provider
                    .newsModel.articles?[index].description
                    .toString() ??
                    "",
                date: provider.newsModel.articles?[index].publishedAt,
                imageUrl: provider.newsModel.articles?[index].urlToImage
                    .toString() ??
                    "",
                contant: provider.newsModel.articles?[index].content
                    .toString() ??
                    "",
                sourceName: provider
                    .newsModel.articles?[index].source?.name
                    .toString() ??
                    "",
                url: provider.newsModel.articles?[index].url
                    .toString() ??
                    "",
              ),
              separatorBuilder: (context, index) => const Divider(
                height: 20,
              ),
              itemCount: provider.newsModel.articles?.length ?? 0),
        ),
      );
    }
  }