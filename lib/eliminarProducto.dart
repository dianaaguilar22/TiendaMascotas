import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/datos/producto.dart';
import 'package:mi_tienda_mascotas/menuAdmin.dart';
import 'package:mi_tienda_mascotas/mongo.dart';

class EliminarProducto extends StatelessWidget {
  const EliminarProducto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eliminar Producto',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const Eliminar(title: 'Eliminar Producto'),
    );
  }
}

class Eliminar extends StatefulWidget {
  const Eliminar({super.key, required this.title});

  final String title;

  @override
  State<Eliminar> createState() => _EliminarState();
}

class _EliminarState extends State<Eliminar> {
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: FutureBuilder(
                      future: MongoData.obtenerProductos(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<dynamic>> snapshot) {
                        ListView comp = ListView();
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          print("Esperando");
                        } else {
                          if (snapshot.hasError) {
                            print("error");
                          } else {
                            comp = datosGenerales(
                                snapshot.data!.toList(), context);
                          }
                        }

                        return comp;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

ListView datosGenerales(List<dynamic> listas, BuildContext context) {
  List<Container> lista = [];
  List datosFinales = [];
  for (var i = 0; i < listas.length; i++) {
    var datos = listas
        .elementAt(i)
        .toString()
        .replaceAll("{", "")
        .replaceAll("}", "")
        .split(",");

    datosFinales.add(datos);
  }

  
  for (var i = 0; i < datosFinales.length; i++) {
    var valores = datosFinales[i];
    var id = valores[0];
    var nombre = valores[1];
    nombre = nombre.toString().split(":").elementAt(1);
    print(nombre);

    Container campo = Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1.0),
            border: Border.all(color: Colors.black.withOpacity(0.25)),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 52, 52, 52).withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]),
        margin: const EdgeInsets.all(2),
        child: Column(
          children: [
            Text(
              "$nombre",
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 205, 112, 19),
              ),
              onPressed: () {
                
                
                 MongoData.delete(id.toString().split(":").elementAt(1).split("\"").elementAt(1));
                  showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                // Recup era el texto que el usuario ha digitado utilizando nuestro
                                // TextEditingController
                                content: Text("Producto Eliminado"),
                              );
                            },
                          );
                 Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Menu()));
              },
              child: const Icon(Icons.cancel_outlined),
            )
          ],
        ));
    lista.add(campo);
  }

  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: lista.length,
    itemBuilder: (context, index) {
      return lista.elementAt(index);
    },
  );
}
