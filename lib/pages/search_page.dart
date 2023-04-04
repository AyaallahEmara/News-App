import 'package:flutter/material.dart';

import '../items/news_item.dart';
import '../services/news_service.dart';
import '../services/sports_service.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void initState()  {
    Future.delayed(Duration.zero,() async {
      //your async 'await' codes goes here
      SportsService service=SportsService();
      Map<String,dynamic> model= await service.getNews();
      List<dynamic> model1=model!['articles'];
      sportsData =model1;
      countSports=sportsData!.length;
      print('count : $countSports');
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

      body: sportsData==null ?
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
        itemCount: sportsData!.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
              child: NewsItem(date: DateTime.parse(sportsData![index]['publishedAt']),
                imageUrl: sportsData![index]['urlToImage'],
                headTitle: sportsData![index]['title'],)
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
