import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/login/login_page.dart';
import 'package:flutter_delivery/src/register/register_page.dart';
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
            // ignore: prefer_const_literals_to_create_immutables
            <int, Color>{
              50: const Color.fromRGBO(231, 13, 50, 0.1),
              100: const Color.fromRGBO(231, 13, 50, 0.2),
              200: const Color.fromRGBO(231, 13, 50, 0.3),
              300: const Color.fromRGBO(231, 13, 50, 0.4),
              400: const Color.fromRGBO(231, 13, 50, 0.5),
              500: const Color.fromRGBO(231, 13, 50, 0.6),
              600: const Color.fromRGBO(231, 13, 50, 0.7),
              700: const Color.fromRGBO(231, 13, 50, 0.8),
              800: const Color.fromRGBO(231, 13, 50, 0.9),
              900: const Color.fromRGBO(231, 13, 50, 1),
            }),
            fontFamily: 'NimbusSans',
      ),
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        },
    );
  }
}
