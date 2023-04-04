import 'package:flutter/material.dart';

import '../items/news_item.dart';

import '../services/science_service.dart';
class SciencePage extends StatefulWidget {
  const SciencePage({Key? key}) : super(key: key);

  @override
  State<SciencePage> createState() => _SciencePageState();
}

class _SciencePageState extends State<SciencePage> {

  @override
  void initState()  {
    Future.delayed(Duration.zero,() async {
      //your async 'await' codes goes here
      ScienceService service=ScienceService();
      Map<String,dynamic> model= await service.getNews();
      List<dynamic> model1=model!['articles'];
      scienceData =model1;
      countScience=scienceData!.length;
      print('count : $countScience');
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

      body: scienceData==null ?
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
        itemCount: scienceData!.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
              child: NewsItem(date: DateTime.parse(scienceData![index]['publishedAt']),
                imageUrl: scienceData![index]['urlToImage'],
                headTitle: scienceData![index]['title'],)
          );
        },
      ),

    );
  }
}
