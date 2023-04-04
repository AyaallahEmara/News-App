
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:news/pages/home_page.dart';
import 'package:news/pages/search_page.dart';
import 'package:news/pages/science_page.dart';

void main() {
  runApp(const NewsApp());
}
class NewsApp extends StatefulWidget {
   const NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  bool isDarkMode=false;
  var _brightness = Brightness.light;
  int _currentIndex=0;
  List<Widget> _Pages=<Widget>[
    HomePage(),
    SearchPage(),
    SciencePage(),
  ];
  void updateUi()
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorSchemeSeed: Colors.orangeAccent,
        brightness: _brightness ,
      ),
     home: _brightness==Brightness.dark? Scaffold(
       appBar: AppBar(
         title: Text('News App',style:
         TextStyle(
           color: Colors.white,
         ),
         ),
         actions: [
           Padding(
             padding: const EdgeInsets.only(right: 5),
             child: Icon(Icons.search,color: Colors.white,),
           ),
           IconButton(onPressed: () {
             var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
            // print(brightness);
             print(_brightness);
              isDarkMode = _brightness == Brightness.dark;
              if(isDarkMode==true) {
               _brightness= Brightness.light;
               print(_brightness);
                updateUi();
              }
                else {
                _brightness=Brightness.dark;
                print(_brightness);
                updateUi();
              }
           }, icon: Icon(Icons.light_mode,color: Colors.white,)),
         ],
       ),

       body: Center(
         child: _Pages.elementAt(_currentIndex),
       ),
       bottomNavigationBar: BottomNavigationBar(
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
       ),
     )
         :
     Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         title: Text('News App',style:
         TextStyle(
           color: Colors.black,
         ),
         ),
         actions: [
           Padding(
             padding: const EdgeInsets.only(right: 5),
             child: Icon(Icons.search,color: Colors.black,),
           ),
           IconButton(onPressed: () {
             var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
             // print(brightness);
             print(_brightness);
             isDarkMode = _brightness == Brightness.dark;
             if(isDarkMode==true) {
               _brightness= Brightness.light;
               print(_brightness);
               updateUi();
             }
             else {
               _brightness=Brightness.dark;
               print(_brightness);
               updateUi();
             }
           }, icon: Icon(Icons.light_mode,color: Colors.black,)),
         ],
       ),

       body: Center(
         child: _Pages.elementAt(_currentIndex),
       ),
       bottomNavigationBar: BottomNavigationBar(
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
       ),
     ),
    );
  }
}

