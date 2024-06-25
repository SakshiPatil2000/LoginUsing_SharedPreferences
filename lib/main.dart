import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  static const String KEYLOGIN ='login';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


   whereToGo();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Icon(Icons.account_circle, color: Colors.white,),
        ),
      )
    );
  }

  void whereToGo() async{
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn= sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), (){

      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePage(),
              ));
        }else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginPage(),
              ));
        }
      }else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginPage(),
            ));
      }


    });
  }
}
