import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_delivery_udemy/src/api/environment.dart';
import 'package:flutter_delivery_udemy/src/models/response_api.dart';
import 'package:flutter_delivery_udemy/src/models/user.dart';
import 'package:http/http.dart' as http;

class UsersProvider {
  //necesitamos la URL
  String _url = Environment.API_DELIVERY;
  //necesitamos a donde vamos apuntar la peticion
  String _api = '/api/users';

  BuildContext context;
  Future init(BuildContext context) {
    this.context = context;
  }

  //creamos el metodo para hacer la peticion
  //nos retorna un future y una respuesta desde el servidor de tipo succes, message y data
  Future<ResponseApi> create(User user) async {
    //hacemo la peticion
    /**
     * authority: es la URL a la cual queremos hacer la peticion
     */
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {'Content-type': 'application/json'};

      final res = await http.post(url, headers: headers, body: bodyParams);
      //data es la respuesta que nos retorno nodejs al momento de recibir la peticion, la de succes: true o false
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<ResponseApi> login(String email, String password) async {
    try {
      Uri url = Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({'email': email, 'password': password});
      Map<String, String> headers = {'Content-type': 'application/json'};

      final res = await http.post(url, headers: headers, body: bodyParams);
      //data es la respuesta que nos retorno nodejs al momento de recibir la peticion, la de succes: true o false
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
