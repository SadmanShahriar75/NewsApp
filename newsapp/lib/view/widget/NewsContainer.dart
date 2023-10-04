import 'package:flutter/material.dart';
import 'package:newsapp/view/details.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;

  String newsDec;
  String newsCnt;
  String newsUrl;

  NewsContainer({
    super.key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDec,
    required this.newsCnt,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             FadeInImage.assetNetwork(
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: "assets/news.jpeg",
            image: imgUrl),

            const SizedBox(
              height: 5,
            ),
            Text(
              newsHead.length > 70
               ? newsHead.substring(0, 70) 
              : newsHead,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsDec,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.black38),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsCnt.length > 200
                  ? newsCnt.substring(0, 200)
                  : " ${newsCnt.toString().substring(0, newsCnt.length - 15)}....",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailViewScreen(newsUrl: newsUrl)));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      "Read More",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
