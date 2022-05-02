import 'package:flutter/material.dart';
import 'package:flutter_delivery_udemy/src/models/user.dart';
import 'package:flutter_delivery_udemy/src/utils/shared_pref.dart';

class RolesController {
  BuildContext context;
  Function refresh;
  User user;
  SharedPref sharedPref = SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    //obtenemos el usuario de sesion, el que se creó cuando logueamos al usuario
    user = User.fromJson(await sharedPref.read('user'));
    refresh();
  }

  void goToPage(String route) {
    print(user.toJson());
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
