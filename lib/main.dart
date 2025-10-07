import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(CanAwareApp());
}

class CanAwareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CanAware - Cancer Awareness',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
