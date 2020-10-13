import 'package:flutter/material.dart';

import './depedency_injection.dart';
import './views/homepage.dart';

void main() {
  DependencyInjection.selectMode(Mode.PROD);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Currencies',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        // canvasColor: Color(0xffFDBA39),
        primaryColor: Color(0xff262C72),
        accentColor: Color(0xff6BC2B3),
      ),
    );
  }
}
