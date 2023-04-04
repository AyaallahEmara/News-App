import 'package:flutter/material.dart';


class NewsItem extends StatelessWidget {
  DateTime date;
  String headTitle;
  String? imageUrl;
  NewsItem({required this.date, required this.headTitle,
     this.imageUrl, });
 // VoidCallback? updateUi;
 // NewsItem({required this.updateUi});
  @override
    Widget build(BuildContext context)  {
   // print(newsModel);

      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          height: 110,
                          child:
                      /*    FadeInImage(
                            image: NetworkImage(imageUrl),
                            placeholder: AssetImage(
                                "assets/images/image.png"),
                            imageErrorBuilder:
                                (context, error, stackTrace) {
                              return Image.asset(
                                  'assets/images/image.png',
                                  fit: BoxFit.fitWidth);
                            },
                            fit: BoxFit.fitWidth,
                          )*/
                         imageUrl == null ?
                         Container(
                             width: 150,
                             height: 110,
                             child:
                               Image.network('https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png')):
                         Container(
                           width: 150,
                           height: 110,
                           child:
                          Image.network(imageUrl!)),
                          ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                          width: 200,
                          child: Text(/*'VW reveals ID 2all affordable EV concept with 279 mile range - Electrek'*/
                            headTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                          alignment: Alignment.topLeft,
                          height: 40,
                          width: 200,
                          child: Text(
                              '${date.year.toString()} - ${date.month.toString()} - ${date
                                  .day.toString()}')),
                    ),
                  ],
                ),

              ],

            ),
            const Divider(
              color: Color(0xFF6C8090),
              thickness: 2,
              indent: 0,
              endIndent: 0,
              height: 10,
            ),
          ],
        ),


      );


  }
}
