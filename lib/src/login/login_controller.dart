import 'package:flutter/material.dart';

class LoginController {

  BuildContext? context;

  Future? init(BuildContext context) async {
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }
}