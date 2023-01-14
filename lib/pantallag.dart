import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/accesorios.dart';
import 'package:mi_tienda_mascotas/alimeng.dart';
import 'package:mi_tienda_mascotas/juguetes.dart';
import 'package:mi_tienda_mascotas/main.dart';
import 'package:mi_tienda_mascotas/productCuiG.dart';
class PantallaG extends StatelessWidget {
  const PantallaG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gatos',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Gatos'),
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
            Image.asset('images/gaitos.jpg'),
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
                              builder: (context) => const AlimenG(),
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
                              builder: (context) => const ProductCuiG(),
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