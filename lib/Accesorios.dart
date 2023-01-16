import 'package:flutter/material.dart';
import 'package:mi_tienda_mascotas/alimenp.dart';
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: FutureBuilder(
                future: MongoData.obtenerAlimentoAcc(),
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
