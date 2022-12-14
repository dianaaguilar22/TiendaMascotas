import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/alimenp.dart';
import 'package:mi_tienda_mascotas/juguetesP.dart';
import 'package:mi_tienda_mascotas/main.dart';
import 'package:mi_tienda_mascotas/productCuiP.dart';

class PantallaP extends StatelessWidget {
  const PantallaP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
            Image.asset('images/perritos.jpg'),
            //botones
            ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AlimenP() ,
                          ));
                    },
                    child: const Text("Alimentos")),
                    //segundo boton 
                     ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductCuiP() ,
                          ));
                    },
                    child: const Text("Productos de cuidado")),
                     ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JuguetesP() ,
                          ));
                    },
                    child: const Text("Juguetes")),
                     ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MiApp() ,
                          ));
                    },
                    child: const Text("Accesorios")),
                      ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MiApp() ,
                          ));
                    },
                    child: const Text("Regresar")),
            Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
