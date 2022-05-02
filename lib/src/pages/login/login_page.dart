import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery_udemy/src/pages/login/login_controller.dart';
import 'package:flutter_delivery_udemy/src/utils/my_colors.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con =
      new LoginController(); //instancia del controlador de la navegación entre pantallas a registro
  @override
  void initState() {
    super.initState();
    //metodo para inicializar los controladores
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
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
              child: _circleLogin(),
            ),
            Positioned(
              child: _textLogin(),
              top: 60.0,
              left: 25.0,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  // _imageBanner(),
                  _lottiAnimation(),
                  _texFieldEmail(),
                  _texFieldPassword(),
                  _buttonLogin(),
                  _textDontHaveAccount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lottiAnimation() {
    return Container(
      margin: EdgeInsets.only(
        top: 150.0,
        bottom: MediaQuery.of(context).size.height * 0.10,
      ),
      child: Lottie.asset(
        'assets/json/forest.json',
        width: 350.0,
        height: 200.0,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _textLogin() {
    return const Text(
      'LOGIN',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
          fontFamily: 'NimbusSans'),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: MyColors.primaryColor),
        ),
        const SizedBox(
          width: 7.0,
        ),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text('Regístrate',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor,
              )),
        ),
      ],
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30.0),
      child: ElevatedButton(
        onPressed: _con.login,
        child: const Text('Ingresar'),
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
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
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

  Widget _texFieldPassword() {
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

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 100.0, bottom: MediaQuery.of(context).size.height * 0.10),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200.0,
        height: 200.0,
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      width: 230.0,
      height: 240.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: MyColors.primaryColor),
    );
  }
}
