import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pfa_project/modulesusers/HomeScreens/home_screen.dart';
import 'package:pfa_project/modulesusers/accompnant/accompagne.dart';
import 'package:pfa_project/modulesusers/loginScreens/login_screen.dart';

class registration extends StatefulWidget {
  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  TextEditingController lname = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController IdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController prenom = TextEditingController();
  late String selectedOption = 'A1';
  late String selectedOption2 = 'A1';
  TextEditingController password = TextEditingController();

  TextEditingController nbchamb = TextEditingController();

  TextEditingController nbaccomp = TextEditingController();
  late bool _isAuteur = false;
  late bool _isInvite = false;
  late bool _isParticipant = false;
  var isPassword = true;

  /*Future login(BuildContext cont) async {
    var url = "http://localhost/localconnect/login.php";
    var response = await http.post(url, body: {
      "lname": lname.text,
      "email": email.text,
      "prenom": prenom.text,
      "password": password.text,
      "nbchamb": nbchamb.text,
      "nbaccomp": nbaccomp.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Navigator.push(
        cont,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
    Fluttertoast.showToast(
      msg: "error",
    );
  }
*/
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.purple.shade50,
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Inscription',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1])),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Last name * ',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: lname,
                          onChanged: (String value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            print(value);
                          },
                          decoration: const InputDecoration(
                            labelText: ' last name ',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'First name *',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: prenom,
                          onChanged: (String value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            print(value);
                          },
                          decoration: const InputDecoration(
                            labelText: 'first name',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Participant type *',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(children: [
                          Row(
                            children: [
                              Text("author"),
                              Switch(
                                value: _isAuteur,
                                onChanged: (value) {
                                  setState(() {
                                    _isAuteur = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Guest "),
                              Switch(
                                value: _isInvite,
                                onChanged: (value) {
                                  setState(() {
                                    _isInvite = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Participant"),
                              Switch(
                                value: _isParticipant,
                                onChanged: (value) {
                                  setState(() {
                                    _isParticipant = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                _isAuteur
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[100],
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Paper ID *',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    controller: IdController,
                                    onChanged: (String value) {
                                      print(value);
                                    },
                                    onFieldSubmitted: (value) {
                                      print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Paper ID';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      print(value);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: ' Paper ID',
                                      prefixIcon: Icon(Icons.confirmation_num),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[100],
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'title * ',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    controller: titleController,
                                    onChanged: (String value) {
                                      print(value);
                                    },
                                    onFieldSubmitted: (value) {
                                      print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your title ';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      print(value);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'title ',
                                      prefixIcon: Icon(Icons.title),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Mail *',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: 'E-mail',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Password * ',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isPassword,
                          onChanged: (String value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your passeword';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'Password ',
                            prefixIcon: Icon(Icons.password_rounded),
                            suffixIcon: IconButton(
                                icon: isPassword
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Room Number *',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 100.0,
                          height: 65.0,
                          child: TextField(
                            controller: nbchamb,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: const InputDecoration(
                              hintText: 'room number',
                              prefixIcon: Icon(Icons.format_list_numbered),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (text) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Room type',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: DropdownButton<String>(
                            value: selectedOption,
                            items: const [
                              DropdownMenuItem(
                                value: 'A1',
                                child: Text('A1'),
                              ),
                              DropdownMenuItem(
                                value: 'A2',
                                child: Text('A2'),
                              ),
                              DropdownMenuItem(
                                value: 'A3',
                                child: Text('A3'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[100],
                          ),
                          height: 40.0,
                          width: 90.0,
                          child: MaterialButton(
                            color: Colors.purple,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationForm()),
                              );
                            },
                            child: const Text(
                              'ADD',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              'Number of companions *',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              width: 100.0,
                              height: 65.0,
                              child: TextField(
                                controller: nbaccomp,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  hintText: 'number of companions',
                                  prefixIcon: Icon(Icons.format_list_numbered),
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (text) {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.purple,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            },
                            child: const Text(
                              'registrer',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Text('do you have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text(
                            'Sign in ',
                            style: TextStyle(color: Colors.purple),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
