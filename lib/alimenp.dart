import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mi_tienda_mascotas/mongo.dart';

class AlimenP extends StatelessWidget {
  const AlimenP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alimento para perros',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Alimento para perros'),
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
              'images/perro.jpg',
              width: 180,
              height: 180,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: FutureBuilder(
                future: MongoData.obtenerAlimentoPerro(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  ListView comp = ListView();
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("Esperando");
                  } else {
                    if (snapshot.hasError) {
                      print("error");
                    } else {
                      comp = datosAlimentos(snapshot.data!.toList(), context);
                    }
                  }

                  return comp;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ListView datosAlimentos(List<dynamic> listas, BuildContext context) {
  List<Row> lista = [];
  List datosFinales = [];
  for (var i = 0; i < listas.length; i++) {
    var datos = listas
        .elementAt(i)
        .toString()
        .replaceAll("{", "")
        .replaceAll("}", "")
        .split(",");

    datosFinales.add(datos);
  }

  Container temp = Container();
  for (var i = 0; i < datosFinales.length; i++) {
    var valores = datosFinales[i];
    var id = valores[0];
    var nombre = valores[1];
    nombre = nombre.toString().split(":").elementAt(1);
    print(nombre);
    String imagen = "alimento-perro-1.jpg";
    switch (Random().nextInt(5)) {
      case 0:
        imagen = "alimento-perro-1.jpg";
        break;
      case 1:
        imagen = "comida-de-gato-1.jpg";
        break;
      case 2:
        imagen = "alimento-perro-3.jpg";
        break;
      case 3:
        imagen = "champu-mascotas.jpg";
        break;
      case 4:
        imagen = "collar-mascota.jpg";
        break;
      
    }
    Container campo = Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.black.withOpacity(0.25)),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 52, 52, 52).withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]),
        margin: const EdgeInsets.all(7),
        child: Column(
          children: [
            Image.asset(
              "images/$imagen",
              width: 80,
              height: 80,
            ),
            Text(
              "$nombre",
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        ));

    if (i % 2 == 0 && i != 0 && i + 1 < datosFinales.length) {
      lista.add(
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: temp,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: campo,
              )
            ]),
      );
    } else if (i + 1 == datosFinales.length) {
      lista.add(
        Row(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: campo,
          )
        ]),
      );
    }
    temp = campo;
  }

  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: lista.length,
    itemBuilder: (context, index) {
      return lista.elementAt(index);
    },
  );
}
