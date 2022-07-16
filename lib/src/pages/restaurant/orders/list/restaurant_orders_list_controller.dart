import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/user.dart';
import '../../../../utils/shared_pref.dart';

class RestaurantOrdersListController {
  BuildContext? context;
  late Function refresh;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  late User user;
  bool isInited = false;

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    isInited = true;
    refresh();
  }

  void logout() {
    _sharedPref.logout(context!);
  }

  void openDrawer() {
    key.currentState!.openDrawer();
  }

  void goToRoles() {
    Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
  }
}