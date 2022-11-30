import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/alimenO.dart';
import 'package:mi_tienda_mascotas/juguetesO.dart';
import 'package:mi_tienda_mascotas/main.dart';
import 'package:mi_tienda_mascotas/productCuiO.dart';
class PantallaO extends StatelessWidget {
  const PantallaO({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Otros'),
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
            Image.asset('images/Animalitos.jpg'),
            //botones 
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlimenO(),
                      ));
                },
                child: const Text("Alimentos")),
            //segundo boton
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>const ProductCuiO(),
                      ));
                },
                child: const Text("Productos de cuidado")),
              ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JuguetesO(),
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
                        builder: (context) => const MiApp(),
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
