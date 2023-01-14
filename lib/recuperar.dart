import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/login.dart';



class Recuperar extends StatelessWidget {
  const Recuperar({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tienda de Mascotas',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const PaginaRecuperar(),
        debugShowCheckedModeBanner: false);
  }
}

class PaginaRecuperar extends StatefulWidget {
  const PaginaRecuperar({super.key});

  @override
  State<PaginaRecuperar> createState() => _PaginaRecuperarState();
}

class _PaginaRecuperarState extends State<PaginaRecuperar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Recuperar"),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 250, 250),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'images/pet.jpg',
                      width: 300,
                      height: 300,
                    ),
                    const Text(
                      "Recuperar Contraseña",
                      style: TextStyle(
                          color: Color.fromARGB(255, 110, 177, 239),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                    )),
                   
                    btnRecuperar(context),
                    
                    
                  ],
                )
              ],
            )));
  }
}

ElevatedButton btnRecuperar(BuildContext context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 38, 120, 243),
      ),
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
      },
      child: const Text(
        "Enviar Correo",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ));
}