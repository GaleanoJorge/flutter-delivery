import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/models/response_api.dart';
import 'package:flutter_delivery/src/models/user.dart';
import 'package:flutter_delivery/src/provider/users_provider.dart';
import 'package:flutter_delivery/src/utils/my_snackbar.dart';

class RegisterController {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  Future? init(BuildContext context) async {
    this.context = context;
    this.usersProvider.init(context);
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

    User user = User(
        email: email,
        name: name,
        lastname: lastName,
        phone: phone,
        password: password);

    ResponseApi? responseApi = await usersProvider.create(user);
    MySnackbar.show(context!, responseApi!.message);

    if (responseApi.success) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context!, 'login');
      });
    }
  }

  void back() {
    Navigator.pop(context!);
  }
}
