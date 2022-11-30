import 'package:flutter/material.dart';

class ProductCuiG extends StatelessWidget {
  const ProductCuiG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos de cuidado',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
            Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
