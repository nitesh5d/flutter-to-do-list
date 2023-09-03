import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home>{


  @override
  build(context){
    return Scaffold(body: Center(child: Text("NoteKeeper"),),);
  }
}