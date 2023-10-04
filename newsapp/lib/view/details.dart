import 'package:flutter/material.dart';

class DetailViewScreen extends StatelessWidget {
  String newsUrl;

  DetailViewScreen({super.key, required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(newsUrl)),
    );
  }
}
