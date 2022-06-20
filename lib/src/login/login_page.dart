import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(children: <Widget>[
          _imageBanner(),
          _textfieldLogin('Correo Electrónico'),
          _textfieldLogin('Contraseña'),
          _botonIngreso(),
          _textDontHaveAccount(),
        ]),
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('¿No tienes cuenta?', style: TextStyle(
                    color: MyColors.primaryColor,),),
            SizedBox(
              width: 7,
            ),
            FlatButton(
              child: Text(
                'Registrate',
                style: TextStyle(
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            )
          ],
        );
  }

  Widget _botonIngreso() => ElevatedButton(onPressed: () {}, child: Text('Ingresar'));

  Widget _textfieldLogin(String hintText) {
    return TextField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
        );
  }

  Widget _imageBanner() {
    return Image.asset('assets/img/delivery.png', width: 200, height: 200);
  }
}
