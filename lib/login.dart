import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class LoginPage extends StatelessWidget{

  var uemailController = TextEditingController();
  var upassController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Center(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Icon(Icons.account_circle,size : 100,color: Colors.blue,),
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: uemailController,
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    )
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: upassController,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    )
                  ),
                ),
                SizedBox(height: 11,),

                ElevatedButton(onPressed: () async{
                  //if successfully logged in

                  var sharedPref=await SharedPreferences.getInstance();
                  sharedPref.setBool(MyHomePageState.KEYLOGIN, true);

                   Navigator.pushReplacement(context,
                       MaterialPageRoute(builder: (context)  =>HomePage(),
                       ));

                }, child: Text('Login'))


              ],

            ),
          ),

        ),
      ),
    );
  }

}