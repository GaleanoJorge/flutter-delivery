import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:flutter_delivery/src/utils/my_colors.dart';

class ClientProductsListPage extends StatefulWidget {
  ClientProductsListPage({Key? key}) : super(key: key);

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  final ClientProductsListController _con = ClientProductsListController();

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
    return _con.isInited
        ? Scaffold(
            key: _con.key,
            appBar: AppBar(
              leading: _menuDrawer(),
            ),
            drawer: _drawer(),
            body: Center(
              child: ElevatedButton(
                child: const Text('Cerrar sesión'),
                onPressed: _con.logout,
              ),
            ),
          )
        : const Scaffold(
            body: Text(''),
          );
  }

  Widget _menuDrawer() {
    return GestureDetector(
        onTap: _con.openDrawer,
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/img/menu.png',
            width: 20,
            height: 20,
          ),
        ));
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: MyColors.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_con.user.name} ${_con.user.lastname}',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Text(
                    _con.user.email ?? '',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                  Text(
                    _con.user.phone ?? '',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(top: 10),
                    child: FadeInImage(
                      image: _con.user.image != null
                          ? NetworkImage(_con.user.image)
                          : const NetworkImage(
                              "https://programacion.net/files/article/20161110041116_image-not-found.png"),
                      fit: BoxFit.contain,
                      fadeInDuration: const Duration(milliseconds: 50),
                      placeholder: const AssetImage('assets/img/no-image.png'),
                    ),
                  )
                ],
              )),
          const ListTile(
            title: Text('Editar perfil'),
            trailing: Icon(Icons.edit_outlined),
          ),
          const ListTile(
            title: Text('Mis pedidos'),
            trailing: Icon(Icons.shopping_cart_outlined),
          ),
          _con.user.roles.length > 1
              ? ListTile(
                  onTap: _con.goToRoles,
                  title: const Text('Seleccionar rol'),
                  trailing: const Icon(Icons.person_outline),
                )
              : Container(),
          ListTile(
            onTap: _con.logout,
            title: const Text('Cerrar sesión'),
            trailing: const Icon(Icons.power_settings_new),
          ),
        ],
      ),
    );
  }

  void refresh() => setState(() {});
}
