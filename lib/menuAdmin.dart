import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/agregarProductos.dart';
import 'package:mi_tienda_mascotas/eliminarProducto.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MenuAdmin Producto',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MenuAdmin(title: 'MenuAdmin Producto'),
    );
  }
}

class MenuAdmin extends StatefulWidget {
  const MenuAdmin({super.key, required this.title});

  final String title;

  @override
  State<MenuAdmin> createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  final controlNombre = TextEditingController();
  final controlCategoria = TextEditingController();
  final controlTipo = TextEditingController();
  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    controlNombre.dispose();
    controlCategoria.dispose();
    controlTipo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'images/mascotas.jpg',
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 31, 203, 62),
                      ),
                      onPressed: () {
                          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AgregarProducto()));

                      },
                      child: const Text(
                        "Agregar Producto",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 31, 203, 62),
                      ),
                      onPressed: () {
                        Navigator.push(
          context, MaterialPageRoute(builder: (context) => const EliminarProducto()));

                      },
                      child: const Text(
                        "Eliminar Producto",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
