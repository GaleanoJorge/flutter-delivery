import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/models/user.dart';
import 'package:flutter_delivery/src/utils/shared_pref.dart';

class RolesController {
  BuildContext? context;
  late Function _refresh;
  User? user;
  final SharedPref _sharedPref = SharedPref();

  Future? init(BuildContext context, Function _refresh) async {
    this.context = context;
    this._refresh = _refresh;

    // OBTENIENDO EL USUARIO DE SESIÓN
    user = User.fromJson(await _sharedPref.read('user'));
    _refresh();
  }

  void goToPage(String route) {
    Navigator.pushNamedAndRemoveUntil(context!, route, (route) => false);
  }
}
