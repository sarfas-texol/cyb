import 'package:cyb/provider/homePagePro.dart';
import 'package:cyb/ui/homePage.dart';
import 'package:cyb/ui/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>HomePagePro())


      ],
        child:MyApp() ,
      ),

  );


  //runApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
