import 'package:flutter/material.dart';

class ClientProductsListPage extends StatefulWidget {
  ClientProductsListPage({Key? key}) : super(key: key);

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('LISTA DE PRODUCTOS'),
      ),
    );
  }
}
