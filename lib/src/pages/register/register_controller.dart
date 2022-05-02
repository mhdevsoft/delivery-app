import 'package:flutter/material.dart';
import 'package:flutter_delivery_udemy/src/models/response_api.dart';
import 'package:flutter_delivery_udemy/src/models/user.dart';
import 'package:flutter_delivery_udemy/src/provider/users_provider.dart';
import 'package:flutter_delivery_udemy/src/utils/my_snackbar.dart';

class RegisterController {
  BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  //método para inicializar estas variables

  Future init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastname = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmpassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmpassword.isEmpty) {
      return MySnackbar.show(context, 'Debes llenar todos los campos');
    }

    if (confirmpassword != password) {
      MySnackbar.show(context, 'Las contraseñas no coinciden');
      return;
    }

    if (password.length < 6) {
      MySnackbar.show(
          context, 'La contraseña debe tener al menos 6 caracteres');
      return;
    }

    User user = User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password);

    ResponseApi responseApi = await usersProvider.create(user);

    MySnackbar.show(context, responseApi.message);
    if (responseApi.success) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, 'login');
      });
    }

    // print('RESPUESTA: ${responseApi?.toJson()}');
  }

  void back() {
    Navigator.pop(context);
  }
}
