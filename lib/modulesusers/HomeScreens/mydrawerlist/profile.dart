import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final username = routeArgs['user'];
    final initials = username?.split('@')[0];

    return Scaffold(
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/conference.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              '$initials',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Participant',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            Divider(
              thickness: 2,
              color: Colors.grey[300],
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('$username'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('(123) 456-7890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('New York, NY'),
            ),
          ],
        ),
      ),
    );
  }
}
