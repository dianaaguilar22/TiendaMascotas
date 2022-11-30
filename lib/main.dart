import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/pantallaOtros.dart';
import 'package:mi_tienda_mascotas/pantallaG.dart';
import 'package:mi_tienda_mascotas/pantallaP.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mi tienda de mascotas",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Aqui van los botones
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PantallaP() ,
                          ));
                    },
                    child: const Text("Perros")),
                  //Poner Segundo boton
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PantallaG() ,
                          ));
                    },
                    child: const Text("Gatos")),
                    //poner tercer boton
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PantallaO() ,
                          ));
                    },
                    child: const Text("Otros")),
                  
              ],
              ),
            ),)
          ],
        ));
  }
}
