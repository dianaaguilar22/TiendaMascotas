import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/mongo.dart';

class accesorios extends StatelessWidget {
  const accesorios({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accesorios',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Accesorios'),
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
              'images/Accesorios.jpg',
              width: 180,
              height: 180,
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width ,
              height:300 ,
              child: FutureBuilder(
                    future: MongoData.productos(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      ListView comp = new ListView();
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print("Esperando");
                      } else {
                        if (snapshot.hasError) {
                          print("error");
                        } else {
                          comp = datosComunidad(snapshot.data!.toList(), true);
                        }
                      }

                      return comp;
                    },
                  ),
            )
          ],
        ),
      ),
    );
  }
}
ListView datosComunidad(List<dynamic> listas, bool comunidad) {
  List<Container> lista = [];
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

  print(datosFinales);

  for (var i = 0; i < datosFinales.length; i++) {
    var valores = datosFinales[i];
    var id = valores[0];
    var nombre = valores[1];
   
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
              Text("      Producto \n $id"),
              Text("\n $nombre"),
              
            ],
          ));
    
  }
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: lista.length,
    itemBuilder: (context, index) {
      return lista.elementAt(index);
    },
  );
}
