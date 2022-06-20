import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/login/login_controller.dart';
import 'package:flutter_delivery/src/utils/my_colors.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginController _con = new LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _con.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(top: -80, left: -100, child: _circleLogin()),
              Positioned(top: 60, left: 25, child: _textLogin()),
              Column(children: <Widget>[
                _animation(),
                _textfieldLogin('Correo Electrónico', Icons.email),
                _textfieldLogin('Contraseña', Icons.lock),
                _botonIngreso(),
                _textDontHaveAccount(),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(
            color: MyColors.primaryColor,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          child: Text(
            'Registrate',
            style: TextStyle(
                color: MyColors.primaryColor, fontWeight: FontWeight.bold),
          ),
          onTap: _con.goToRegisterPage,
        )
      ],
    );
  }

  Widget _botonIngreso() => Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('INGRESAR'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
      );

  Widget _textfieldLogin(String hintText, IconData iconData) => Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: MyColors.primaryColorDark,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              iconData,
              color: MyColors.primaryColor,
            ),
          ),
        ),
      );

  // Widget _imageBanner() => Container(
  //     margin: EdgeInsets.only(
  //         top: 100, bottom: MediaQuery.of(context).size.height * 0.22),
  //     child: Image.asset('assets/img/delivery.png', width: 200, height: 200));

  Widget _animation() => Container(
      margin: EdgeInsets.only(
          top: 100, bottom: MediaQuery.of(context).size.height * 0.09),
      child: Lottie.asset('assets/json/delivery.json',
          width: 350, height: 200, fit: BoxFit.fill));

  Widget _circleLogin() => Container(
        width: 240,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor,
        ),
      );

  Widget _textLogin() => Text('LOGIN',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ));
}
