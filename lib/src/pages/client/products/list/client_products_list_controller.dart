import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/utils/shared_pref.dart';

class ClientProductsListController {

  BuildContext? context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future? init(BuildContext context) async {
    this.context = context;
  }

  void logout() {
    _sharedPref.logout(context!);
  }

  void openDrawer() {
    key.currentState!.openDrawer();
  }
}