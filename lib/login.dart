import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/inicio.dart';

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
                    )),
                    TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Password',
                        )),
                    btnLogin(context),
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

ElevatedButton btnLogin(BuildContext context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 38, 120, 243),
      ),
      onPressed: () {
        navegar("home", context);
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
    case 'recovery':
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Recuperar()));
      break;
  }
}