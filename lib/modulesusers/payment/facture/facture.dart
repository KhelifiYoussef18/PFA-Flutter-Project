import 'package:flutter/material.dart';
import 'package:pfa_project/modulesusers/payment/payment/payment.dart';

class FacturePage extends StatefulWidget {
  const FacturePage({Key? key}) : super(key: key);

  @override
  _FacturePageState createState() => _FacturePageState();
}

class _FacturePageState extends State<FacturePage> {
  String _nom = '';
  String _prenom = '';
  bool _isAuteur = false;
  bool _isInvite = false;
  bool _isParticipant = false;
  int _numberOfRooms = 0;
  int _numberOfAccompanat = 0;

  double _calculateBill() {
    double totalCost = 0.0;

    if (_isAuteur) {
      totalCost += 60.0;
    }

    if (_isInvite) {
      totalCost += 40.0;
    }

    if (_isParticipant) {
      totalCost += 80.0;
    }

    totalCost += _numberOfRooms * 150.0;
    totalCost += _numberOfAccompanat * 50.0;

    return totalCost;
  }

  void _displayBillDialog() {
    if (_nom.isEmpty || _prenom.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Missing required fields'),
            content: Text('Please fill in all required fields.'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    double totalCost = _calculateBill();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invoice'),
          content: Text('the total amount is $totalCost dt'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Text(
                  "invoice",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "last name*",
                    hintText: "Enter your last name ",
                  ),
                  onChanged: (value) {
                    setState(() {
                      _nom = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.grey[200],
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "First Name*",
                    hintText: "enter your first name ",
                  ),
                  onChanged: (value) {
                    setState(() {
                      _prenom = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Titel*"),
                  Checkbox(
                    value: _isAuteur,
                    onChanged: (value) {
                      setState(() {
                        _isAuteur = value!;
                      });
                    },
                  ),
                  Text("Auther"),
                  Checkbox(
                    value: _isInvite,
                    onChanged: (value) {
                      setState(() {
                        _isInvite = value!;
                      });
                    },
                  ),
                  Text("Guest"),
                  Checkbox(
                    value: _isParticipant,
                    onChanged: (value) {
                      setState(() {
                        _isParticipant = value!;
                      });
                    },
                  ),
                  Text("Participant"),
                ],
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Room Number "),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _numberOfRooms =
                                  _numberOfRooms > 0 ? _numberOfRooms - 1 : 0;
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(_numberOfRooms.toString()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _numberOfRooms++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Number of companions *"),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _numberOfAccompanat = _numberOfAccompanat > 0
                                  ? _numberOfAccompanat - 1
                                  : 0;
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(_numberOfAccompanat.toString()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _numberOfAccompanat++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: _displayBillDialog,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text("Consult total amount"),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: Text('Choose Payment Type'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
