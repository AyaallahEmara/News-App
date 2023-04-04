import 'package:flutter/material.dart';

class NewsModel {
  DateTime date;
  String headTitle;
  String imageUrl;

  NewsModel({required this.date, required this.headTitle,
    required this.imageUrl, });

  factory NewsModel.fromJson(dynamic data){
    var jsonData = data['articles'][0];
    return NewsModel(date: DateTime.parse(jsonData['publishedAt']),
        headTitle: jsonData['title'],
        imageUrl: jsonData['urlToImage'],
        );


  }
  @override
  String toString()
  {
    return 'date : $date  head : $headTitle  image : $imageUrl';
  }
}
NewsModel? newsModel;
