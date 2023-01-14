import 'package:flutter/material.dart';

class ProductCuiP extends StatelessWidget {
  const ProductCuiP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos de cuidado',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Productos de cuidado'),
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
              'images/perro2.jpg',
              width: 180,
              height: 180,
            ),
            Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
