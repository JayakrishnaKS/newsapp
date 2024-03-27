import 'package:flutter/material.dart';
import 'package:news_app/controller/category.dart';
import 'package:news_app/view/widgets%20screen/new_card.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void fetchData() async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    CategoryController provider = Provider.of<CategoryController>(context);
    return DefaultTabController(
        length: provider.categoryList.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Color(0xff6A3DE8), fontSize: 20),
            title: Text("Categories"),
            bottom: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              overlayColor: MaterialStatePropertyAll(Colors.white),
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff6A3DE8),
              indicator: BoxDecoration(color: Color(0xff6A3DE8),
                  borderRadius: BorderRadius.circular(10)),
              labelStyle: TextStyle(
                color: Color(0xff6A3DE8),

              ),
              tabs: List.generate(provider.categoryList.length, (index) =>
                  Tab(
                    text: provider.categoryList[index],
                  )),
              onTap: (value) {
                provider.onTap(index: value);
              },),), body: provider.isLoading == true ? const Center(
            child:CircularProgressIndicator()):Padding(padding: EdgeInsets.all(7), child:
            ListView.separated(itemBuilder: (context, index) =>
                NewsCard(title: provider.newsModel.articles?[index].title
                    .toString() ?? "",
                    description: provider.newsModel.articles?[index].description.toString()??"",
                    date: provider.newsModel.articles?[index].publishedAt,
                    imageUrl: provider.newsModel.articles?[index].urlToImage.toString()??"",
                    contant: provider.newsModel.articles?[index].content.toString()??"",
                    sourceName: provider.newsModel.articles?[index].source?.name.toString()??"",
                    url: provider.newsModel.articles?[index].url.toString()??""),
                separatorBuilder: (context,index)=>Divider(
                  height: 20,
                ),
                itemCount: provider.newsModel.articles?.length??0),)
        ),
    );
  }
}
