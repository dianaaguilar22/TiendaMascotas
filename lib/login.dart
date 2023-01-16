import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/agregarProductos.dart';
import 'package:mi_tienda_mascotas/inicio.dart';
import 'package:mi_tienda_mascotas/menuAdmin.dart';

import 'package:mi_tienda_mascotas/recuperar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tienda de Mascotas',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const PaginaLogin(),
        debugShowCheckedModeBanner: false);
  }
}

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final controlEmail = TextEditingController();
  final controlPass = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    controlEmail.dispose();
    controlPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inicio de Sesión"),
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
                      'images/mascotas.jpg',
                      width: 300,
                      height: 300,
                    ),
                    const Text(
                      "Bienvenidos Tienda de Mascotas",
                      style: TextStyle(
                          color: Color.fromARGB(255, 110, 177, 239),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                      controller: controlEmail,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                      controller: controlPass,
                    ),
                    btnLogin(context, controlEmail.text, controlPass.text),
                    const SizedBox(
                      height: 50,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        navegar("recovery", context);
                      },
                      child: const Text(
                        '¿Olvidaste tu contraseña?',
                        style:
                            TextStyle(color: Color.fromARGB(255, 250, 53, 53)),
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}

ElevatedButton btnLogin(BuildContext context, String usuario, String pass) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 38, 120, 243),
      ),
      onPressed: () {
        if (usuario == "diana" && pass == "12345") {
          navegar("home", context);
        } else if (usuario == "admin" && pass == "admin") {
          navegar("menu", context);
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                // Recup era el texto que el usuario ha digitado utilizando nuestro
                // TextEditingController
                content: Text("No existe el usuario"),
              );
            },
          );
        }
      },
      child: const Text(
        "Iniciar Sesión",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ));
}

void navegar(String pantalla, BuildContext context) {
  switch (pantalla) {
    case 'home':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Principal()));
      break;
    case 'menu':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Menu()));
      break;
    case 'recovery':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Recuperar()));
      break;
  }
}
