import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/pages/client/update/client_update_controller.dart';

import '../../../utils/my_colors.dart';

class ClientUpdatePage extends StatefulWidget {
  ClientUpdatePage({Key? key}) : super(key: key);

  @override
  State<ClientUpdatePage> createState() => _ClientUpdatePageState();
}

class _ClientUpdatePageState extends State<ClientUpdatePage> {
  final ClientUpdateController _con = ClientUpdateController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  const SizedBox(height: 50,),
                  _imageUser(),
                  const SizedBox(height: 10),
                  _textfield('Nombre', Icons.person, TextInputType.text,
                      _con.nameController, false),
                  _textfield('Apellido', Icons.person_outline,
                      TextInputType.text, _con.lastNameController, false),
                  _textfield('Teléfono', Icons.phone, TextInputType.phone,
                      _con.phoneController, false),
                  
                ]),
              ),
      ),
      bottomNavigationBar: _botonRegistro(),
    );
  }

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
      } else if (_con.user!.image != null) {
        return NetworkImage(_con.user!.image);
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
          child: const Text('ACTUALIZAR PERFIL'),
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
