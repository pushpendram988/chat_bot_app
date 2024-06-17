import 'dart:async';
import 'dart:ui';

import 'package:chat_bot_app/data/provider/chat_provider.dart';
import 'package:chat_bot_app/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class splashscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return splashscreenState();
  }
}
class splashscreenState extends State<splashscreen>{
  @override
  void initState() {
    super.initState();
Timer(Duration(seconds: 1) , () => Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
        create: (context) =>ChatProvider(),
    child: ChatScreen(),)
)),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("welcome to my chat bot App", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200,color: Colors.white),),
      ),
    );

  }

}