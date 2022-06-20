import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/login/login_page.dart';
import 'package:flutter_delivery/src/utils/my_colors.dart';

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
      title: 'Delivery App Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(MyColors.primaryColor.value,
            <int, Color>{
              50: Color.fromRGBO(231, 13, 50, 0.1),
              100: Color.fromRGBO(231, 13, 50, 0.2),
              200: Color.fromRGBO(231, 13, 50, 0.3),
              300: Color.fromRGBO(231, 13, 50, 0.4),
              400: Color.fromRGBO(231, 13, 50, 0.5),
              500: Color.fromRGBO(231, 13, 50, 0.6),
              600: Color.fromRGBO(231, 13, 50, 0.7),
              700: Color.fromRGBO(231, 13, 50, 0.8),
              800: Color.fromRGBO(231, 13, 50, 0.9),
              900: Color.fromRGBO(231, 13, 50, 1),
            }),
      ),
      initialRoute: 'login',
      routes: {'login': (BuildContext context) => LoginPage()},
    );
  }
}
