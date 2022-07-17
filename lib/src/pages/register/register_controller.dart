import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/models/response_api.dart';
import 'package:flutter_delivery/src/models/user.dart';
import 'package:flutter_delivery/src/provider/users_provider.dart';
import 'package:flutter_delivery/src/utils/my_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class RegisterController {
  BuildContext? context;
  late Function refresh;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  PickedFile? pickedFile;
  File? imageFile;
  bool isInited = false;
  bool isEnable = true;

  late ProgressDialog _progressDialog;

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    usersProvider.init(context);
    _progressDialog = ProgressDialog(context: context);
    isInited = true;
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastName.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MySnackbar.show(context!, 'Debes ingresar todos los campos');
      return;
    }

    if (password != confirmPassword) {
      MySnackbar.show(context!, 'La contraseña no coinside');
      return;
    }

    if (password.length < 6) {
      MySnackbar.show(
          context!, 'La contraseña debe tener al menos 6 caracteres');
      return;
    }

    if (imageFile == null) {
      MySnackbar.show(context!, 'Seleccione una imagen');
      return;
    }

    _progressDialog.show(max: 100, msg: 'Espere un momento');
    isEnable = false;

    User user = User(
      email: email,
      name: name,
      lastname: lastName,
      phone: phone,
      password: password,
      roles: [],
    );

    Stream? stream = await usersProvider.createWithImage(user, imageFile);
    stream?.listen((res) {
      _progressDialog.close();
      // ResponseApi? responseApi = await usersProvider.create(user);
      ResponseApi? responseApi = ResponseApi.fromJson(json.decode(res));
      MySnackbar.show(context!, responseApi.message);

      if (responseApi.success) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context!, 'login');
        });
      } else {
        isEnable = true;
      }
    });
  }

  Future selectImage(ImageSource imageSource) async {
    pickedFile = (await ImagePicker().getImage(source: imageSource));
    if (pickedFile != null) {
      imageFile = File(pickedFile!.path);
    }
    Navigator.pop(context!);
    refresh();
  }

  void showAlertDialog() {
    Widget galleryButton = ElevatedButton(
      onPressed: () {
        selectImage(ImageSource.gallery);
      },
      child: const Text('GALERÍA'),
    );
    Widget cameraButton = ElevatedButton(
      onPressed: () {
        selectImage(ImageSource.camera);
      },
      child: const Text('CÁMARA'),
    );

    AlertDialog alertDialog = AlertDialog(
      title: const Text('Selecciona tu imagen'),
      actions: [
        galleryButton,
        cameraButton,
      ],
    );

    showDialog(
        context: context!,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void back() {
    Navigator.pop(context!);
  }
}
