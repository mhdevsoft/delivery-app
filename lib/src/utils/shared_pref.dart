import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //metodo save para almacenar nueva información en nuestro storage
  void save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    //meteodo para guardar la información.
    prefs.setString(key, json.encode(value));
  }
  //metodo para leer la información almacenada

  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(key) == null) return null;
    return json.decode(prefs.getString(key));
  }

//contains es para saber si existe en el sharepreferences algun dato
  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  //metodo para eliminar un dato de sharepreferences

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  void logout(BuildContext context) async {
    await remove('user');
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
  }
}
