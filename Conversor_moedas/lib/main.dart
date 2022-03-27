import 'package:conversor_moedas/View/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hintStyle: TextStyle(color: Colors.grey),
        ))
  ));
}
