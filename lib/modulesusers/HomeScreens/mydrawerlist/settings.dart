import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1],
          colors: [
            Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
            Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
          ],
        ),
      ),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Type your problem  here',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                // Handle text changes
              },
            ),
          ],
        ),
      ),
    );
  }
}
