import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/news_model.dart';


class NewsService
{
  Future<Map<String,dynamic>> getNews() async
  {

    Uri url=Uri.parse(
     /* 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2eda1f15e18c495b9897d0d834fe49a1'*/
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2eda1f15e18c495b9897d0d834fe49a1'
    );
    http.Response response = await http.get(url);
    Map<String,dynamic> data= jsonDecode(response.body);
   // print(data);
   // NewsModel newsModel=NewsModel.fromJson(data);
    return data;
  }
}

dynamic? newsData;
int count =0;
