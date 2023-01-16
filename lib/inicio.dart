import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/pantallaG.dart';
import 'package:mi_tienda_mascotas/pantallaOtros.dart';
import 'package:mi_tienda_mascotas/pantallaP.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tienda de Mascotas',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const PaginaPrincipal(),
        debugShowCheckedModeBanner: false);
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tienda de mascotas"),
        ),
        body: ListView(
          children: [
            //Aquí van los widget, imagenes
            Image.asset(
              'images/pet.jpg',
              width: 400,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Aqui van los botones
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PantallaP(),
                            ));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'images/perros.jpg',
                            width: 90,
                            height: 90,
                          ),
                          const Text("Perros"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    //Poner Segundo boton
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PantallaG(),
                            ));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'images/gatos.jpg',
                            width: 90,
                            height: 90,
                          ),
                          const Text("Gatos"),
                        ],
                      ),
                    ),
                    //poner tercer boton
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PantallaO(),
                            ));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'images/otros.jpg',
                            width: 90,
                            height: 90,
                          ),
                          const Text("Otros"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
