import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/conference.jpg'),
              fit: BoxFit.cover),
        ),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
