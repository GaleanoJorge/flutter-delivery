import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/pages/register/register_controller.dart';
import '../../utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _con = RegisterController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(top: -80, left: -100, child: _circleLogin()),
            Positioned(top: 44, left: 0, child: _iconBack()),
            Positioned(top: 60, left: 37, child: _textLogin()),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  _imageUser(),
                  const SizedBox(height: 10),
                  _textfield('Correo Electrónico', Icons.email,
                      TextInputType.emailAddress, _con.emailController, false),
                  _textfield('Nombre', Icons.person, TextInputType.text,
                      _con.nameController, false),
                  _textfield('Apellido', Icons.person_outline,
                      TextInputType.text, _con.lastNameController, false),
                  _textfield('Teléfono', Icons.phone, TextInputType.phone,
                      _con.phoneController, false),
                  _textfield('Contraseña', Icons.lock, TextInputType.text,
                      _con.passwordController, true),
                  _textfield('Confirmar Contraseña', Icons.lock_outline,
                      TextInputType.text, _con.confirmPasswordController, true),
                  _botonRegistro(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleLogin() => Container(
        width: 240,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor,
        ),
      );

  Widget _iconBack() => IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: _con.back,
      );

  Widget _textLogin() => const Text('REGISTRO',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ));

  Widget _imageUser() => GestureDetector(
        onTap: _con.showAlertDialog,
        child: CircleAvatar(
          backgroundImage: _imageProvider(),
          radius: 50,
          backgroundColor: Colors.grey[200],
        ),
      );

  ImageProvider _imageProvider() {
    if (_con.isInited) {
      if (_con.imageFile != null) {
        return FileImage(_con.imageFile!);
      }
    }
    return const AssetImage('assets/img/user_profile_2.png');
  }

  Widget _textfield(
          String hintText,
          IconData iconData,
          TextInputType textInputType,
          TextEditingController textController,
          bool isPassword) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          keyboardType: textInputType,
          controller: textController,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: MyColors.primaryColorDark,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(
              iconData,
              color: MyColors.primaryColor,
            ),
          ),
        ),
      );

  Widget _botonRegistro() => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: ElevatedButton(
          onPressed: _con.isEnable ? _con.register : null,
          child: const Text('INGRESAR'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
      );

  void refresh() => setState(() {});
}
