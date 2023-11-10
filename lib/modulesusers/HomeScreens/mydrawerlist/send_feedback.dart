import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendFeedback extends StatelessWidget {
  const SendFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              "Enter your feedback here :)",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Enter your feedback here',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.feedback_outlined)),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                // Handle text changes
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the button press here
              },
              child: const Text('Submit'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
