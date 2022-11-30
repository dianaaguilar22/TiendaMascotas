import 'package:flutter/material.dart';

class AlimenP extends StatelessWidget {
  const AlimenP ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alimento para perros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
          
            
            Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
