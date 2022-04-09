import 'package:flutter/material.dart';
import 'package:laboratory/pages/intro.dart';
import 'package:laboratory/pages/home.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/' : (context) => IntroPage(),
    //'/home' : (context) => HomePage(),
}
));

