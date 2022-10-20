import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Khoirul App'),
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
  String textHolder = 'Muhamad Khoirul Fahmi';

  void _textHolder() {
    setState(() {
      textHolder = 'Tugas Pemprograman Berbasis Mobile';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            // ignore: prefer_const_constructors
            Text(
              textHolder,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _textHolder(),
        tooltip: 'Ubah Nama',
        label: const Text('Ubah Nama'),
        hoverColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
