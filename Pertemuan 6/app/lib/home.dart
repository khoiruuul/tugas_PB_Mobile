// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();
  bool _bool = false;

  void _Boolean() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      _bool = !_bool;
      if (_bool == true) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ));
        print("True");
      } else {
        print("False");
      }
    });
    prefs.setBool('bool', _bool);
  }

  _getBoolean() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      _bool = prefs.getBool('bool') ?? _bool;
      if (_bool == true) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ));
        print("True");
      } else {
        print("False");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getBoolean();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: GestureDetector(
            onTap: () {
              _Boolean;
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 112, 91, 222),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
