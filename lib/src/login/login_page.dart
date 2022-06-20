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
          Image.asset('assets/img/delivery.png', width: 200, height: 200),
          TextField(
            decoration: InputDecoration(
              hintText: 'Correo Electrónico',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Contraseña',
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Ingresar')),
          Row(
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
          ),
        ]),
      ),
    );
  }
}
