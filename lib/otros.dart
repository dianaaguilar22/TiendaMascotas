import 'package:flutter/material.dart';

class PantallaO extends StatelessWidget {
  const PantallaO({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Otros'),
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
            Image.asset('images/Animalitos.jpg'),
            
            Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
