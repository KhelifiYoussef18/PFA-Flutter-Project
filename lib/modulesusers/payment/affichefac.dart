import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Affiche extends StatefulWidget {
  const Affiche({Key? key}) : super(key: key);

  @override
  State<Affiche> createState() => _AfficheState();
}

class _AfficheState extends State<Affiche> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(''),
          Text(''),
          Text(''),
        ],
      ),
    );
  }
}
