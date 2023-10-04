import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchNews.dart';
import 'package:newsapp/model/newArt.dart';
import 'package:newsapp/view/widget/NewsContainer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late NewsArt newsArt;
  bool isLoading = true;

  GetNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {

      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: 0),
        onPageChanged: (value) {
          setState(() {
            isLoading = true;
          });
           GetNews();
           
        },
       
        itemBuilder: (context, index) {
         
          return  isLoading ? Center(child: CircularProgressIndicator(),) : NewsContainer(
              imgUrl: newsArt.imgUrl,
              newsHead: newsArt.newsHead,
              newsCnt: newsArt.newsCnt,
              newsDec: newsArt.newsDec,
              newsUrl: newsArt.newsUrl);
        },
      ),
    );
  }
}
