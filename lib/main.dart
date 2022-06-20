import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Delivery App Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {'login': (BuildContext context) => LoginPage()},
    );
  }
}
