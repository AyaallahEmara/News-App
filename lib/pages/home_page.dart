import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/pages/search_page.dart';
import 'package:news/services/news_service.dart';

import '../items/news_item.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);
   //int _currentIndex=0;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int _currentIndex=0;

  @override
  void initState()  {
    Future.delayed(Duration.zero,() async {
      //your async 'await' codes goes here
      NewsService service=NewsService();
      Map<String,dynamic> model= await service.getNews();
      List<dynamic> model1=model!['articles'];
      newsData =model1;
      count=newsData!.length;
      print('count : $count');
      updateUi();
    });
    // TODO: implement initState
    super.initState();
  }
  void updateUi()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: newsData==null ?
          Center(
            child: Container(
              child: Text('Wait few seconds',style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),),
            ),
          )
            :

      new ListView.builder(
        itemCount: newsData!.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: NewsItem(date: DateTime.parse(newsData![index]['publishedAt']),
              imageUrl: newsData![index]['urlToImage'],
              headTitle: newsData![index]['title'],)
          );
        },
      ),
    /*  bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.business,),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.sports,),
            label: 'Sports',),
          BottomNavigationBarItem(icon: Icon(Icons.science,),
          label: 'Science',),
        ],
        onTap: (index){
            setState(() {
             // updateUi();
              _currentIndex=index;
            });
        },
      ),*/

    );
  }
}
