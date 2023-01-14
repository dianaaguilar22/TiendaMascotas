import 'package:flutter/material.dart';

class juguetes extends StatelessWidget {
  const juguetes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juguetes',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Juguetes'),
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
              'images/jugando.jpg',
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
