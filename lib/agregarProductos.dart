import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/datos/producto.dart';
import 'package:mi_tienda_mascotas/menuAdmin.dart';
import 'package:mi_tienda_mascotas/mongo.dart';

class AgregarProducto extends StatelessWidget {
  const AgregarProducto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agregar Producto',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const Agregar(title: 'Agregar Producto'),
    );
  }
}

class Agregar extends StatefulWidget {
  const Agregar({super.key, required this.title});

  final String title;

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
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
                    'images/tazon.jpg',
                    width: 180,
                    height: 180,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nombre del Producto',
                    ),
                    controller: controlNombre,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Categoria',
                    ),
                    controller: controlCategoria,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Tipo',
                    ),
                    controller: controlTipo,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 38, 120, 243),
                      ),
                      onPressed: () {
                        if (controlCategoria.text == "" ||
                            controlNombre.text == "" ||
                            controlTipo.text == "") {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                // Recup era el texto que el usuario ha digitado utilizando nuestro
                                // TextEditingController
                                content: Text("Falta llenar algun dato"),
                              );
                            },
                          );
                        } else {
                          MongoData.insert(Producto(nombre: controlNombre.text, categoria: controlCategoria.text, tipo: controlTipo.text));
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                // Recup era el texto que el usuario ha digitado utilizando nuestro
                                // TextEditingController
                                content: Text("Datos Ingresado"),
                              );
                            },
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Menu()));
                        }
                      },
                      child: const Text(
                        "Agregar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
