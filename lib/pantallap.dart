import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/accesorios.dart';
import 'package:mi_tienda_mascotas/alimenp.dart';
import 'package:mi_tienda_mascotas/juguetes.dart';
import 'package:mi_tienda_mascotas/main.dart';
import 'package:mi_tienda_mascotas/productCuiP.dart';

class PantallaP extends StatelessWidget {
  const PantallaP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perros',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Perros'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/perritos.jpg',
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
                              builder: (context) => const AlimenP(),
                            ));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'images/tazon.jpg',
                            width: 50,
                            height: 50,
                          ),
                          const Text("Alimentos"),
                        ],
                      ),
                    ),
                    //Poner Segundo boton
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductCuiP(),
                            ));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'images/champu.jpg',
                            width: 50,
                            height: 50,
                          ),
                          const Text("Productos de cuidado"),
                        ],
                      ),
                    ),
                    //Poner Segundo boton
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const juguetes(),
                            ));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'images/juguetes.jpg',
                            width: 50,
                            height: 50,
                          ),
                          const Text("Juguetes"),
                        ],
                      ),
                    ),
                    //poner tercer boton
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const accesorios(),
                            ));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'images/collar.jpg',
                            width: 50,
                            height: 50,
                          ),
                          const Text("Accesorios"),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
