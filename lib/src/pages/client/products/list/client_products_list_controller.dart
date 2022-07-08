import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/utils/shared_pref.dart';

class ClientProductsListController {

  BuildContext? context;
  
  SharedPref _sharedPref = SharedPref();

  Future? init(BuildContext context) async {
    this.context = context;
  }

  logout() {
    _sharedPref.logout(context!);
  }
}