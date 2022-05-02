import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery_udemy/src/pages/register/register_controller.dart';
import 'package:flutter_delivery_udemy/src/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _con = RegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              //podemos definir donde queremos ubicar el elemento en la pantalla
              top: -80.0,
              left: -100.0,
              child: _circleRegister(),
            ),
            Positioned(
              child: _textRegister(),
              top: 65.0,
              left: 27.0,
            ),
            Positioned(
              child: _iconBack(),
              top: 51.0,
              left: -5.0,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 150.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageUser(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _texFieldEmail(),
                    _texFielName(),
                    _texFielLastName(),
                    _texFielPhone(),
                    _texFielPassword(),
                    _texFielConfirmPassword(),
                    _buttonRegister(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _imageUser() {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60.0,
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _textRegister() {
    return const Text(
      'REGISTRO',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          fontFamily: 'NimbusSans'),
    );
  }

  Widget _iconBack() {
    return IconButton(
        onPressed: _con.back,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30.0),
      child: ElevatedButton(
        onPressed: _con.register,
        child: const Text('Registrarse'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15.0)),
      ),
    );
  }

  Widget _texFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: _con.emailController,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.email,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _texFielName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        controller: _con.nameController,
        decoration: InputDecoration(
          hintText: 'Nombre',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.person,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _texFielLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        controller: _con.lastNameController,
        decoration: InputDecoration(
          hintText: 'Apellido',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.person_outline,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _texFielPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: _con.phoneController,
        decoration: InputDecoration(
          hintText: 'Telefono',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.phone,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _texFielPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.lock,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _texFielConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        obscureText: true,
        controller: _con.confirmPasswordController,
        decoration: InputDecoration(
          hintText: 'Confirmar contraseña',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.lock_outlined,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _circleRegister() {
    return Container(
      width: 230.0,
      height: 240.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: MyColors.primaryColor),
    );
  }
}
