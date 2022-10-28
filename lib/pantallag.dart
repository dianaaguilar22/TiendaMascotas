import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/alimeng.dart';
import 'package:mi_tienda_mascotas/productc.dart';

class PantallaG extends StatelessWidget {
  const PantallaG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
            //botones
            ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const aG() ,
                          ));
                    },
                    child: const Text("Alimentos")),
                    //segundo boton 
                     ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const pCuidado() ,
                          ));
                    },
                    child: const Text("Productos de cuidado")),
            Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
