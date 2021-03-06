import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/pages/client/products/list/client_products_list_page.dart';
import 'package:flutter_delivery/src/pages/client/update/client_update_page.dart';
import 'package:flutter_delivery/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:flutter_delivery/src/pages/login/login_page.dart';
import 'package:flutter_delivery/src/pages/register/register_page.dart';
import 'package:flutter_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:flutter_delivery/src/pages/roles/roles_page.dart';
import 'package:flutter_delivery/src/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => const RegisterPage(),
        'roles': (BuildContext context) => RolesPage(),
        'client/products/list': (BuildContext context) => ClientProductsListPage(),
        'client/update': (BuildContext context) => ClientUpdatePage(),
        'restaurant/orders/list': (BuildContext context) => RestaurantOrdersListPage(),
        'delivery/orders/list': (BuildContext context) => DeliveryOrdersListPage(),
        },
    );
  }
}
