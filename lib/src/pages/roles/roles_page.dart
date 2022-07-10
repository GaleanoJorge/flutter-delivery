import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/models/rol.dart';
import 'package:flutter_delivery/src/pages/roles/roles_controller.dart';

class RolesPage extends StatefulWidget {
  RolesPage({Key? key}) : super(key: key);

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  RolesController _con = RolesController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, _refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona un rol'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.14),
        child: _con.user != null
            ? ListView.builder(
                itemCount: _con.user?.roles.length,
                itemBuilder: (BuildContext context, int index) {
                  return _cardRol(_con.user!.roles[index]);
                })
            : const CircularProgressIndicator(),
      ),
    );
  }

  Widget _cardRol(Rol rol) {
    return GestureDetector(
      onTap: () {
        _con.goToPage(rol.route);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            child: FadeInImage(
              image: rol.image != null
                  ? NetworkImage(rol.image)
                  : const NetworkImage(
                      "https://programacion.net/files/article/20161110041116_image-not-found.png"),
              placeholder: const AssetImage('assets/img/no-image.png'),
              fit: BoxFit.contain,
              fadeInDuration: const Duration(milliseconds: 50),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            rol.name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void _refresh() => setState(() {});
}
