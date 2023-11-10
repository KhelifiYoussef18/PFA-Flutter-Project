import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Insert extends StatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nbchamb = TextEditingController();
  TextEditingController nbaccomp = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController IdController = TextEditingController();
  late bool _isAuteur = false;
  late bool _isInvite = false;
  late bool _isParticipant = false;
  var isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Center(
                  child: const Text(
                    'Insert users',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
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
                          'Last name* ',
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
                              return 'Please enter your last name';
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
                          'First name * ',
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
                            labelText: '  first name  ',
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
                          'Your title *',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(children: [
                          Row(
                            children: [
                              Text("Auther"),
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
                              Text("Guest"),
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
                                    'Id Papier ',
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
                                        return 'Please enter your Id papier';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      print(value);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: ' Id paper ',
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
                                    'title : ',
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
                                      labelText: '  title paper ',
                                      prefixIcon: Icon(Icons.title),
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
                                    'Room session  : ',
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
                                      maxLength: 2,
                                      decoration: const InputDecoration(
                                        hintText: 'number',
                                        prefixIcon:
                                            Icon(Icons.format_list_numbered),
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
                                    'Id session : ',
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
                                      decoration: const InputDecoration(
                                        hintText: 'number',
                                        prefixIcon:
                                            Icon(Icons.format_list_numbered),
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (text) {},
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
                          'Adresse Mail : ',
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
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
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
                          'Password : ',
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
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'password :',
                            prefixIcon: Icon(Icons.password_rounded),
                            suffixIcon: IconButton(
                                icon: isPassword
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility,
                                        color: Colors.purple),
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
                SizedBox(
                  height: 10.0,
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
                          'number phone: ',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: telephoneController,
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number ';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            print(value);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(19),
                          ],
                          decoration: InputDecoration(
                            labelText: 'num _tel:',
                            prefixIcon: Icon(Icons.phone),
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
                          'Nomber de chambre : ',
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
                              hintText: 'number',
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
                            onPressed: () {},
                            child: const Text(
                              'registrer',
                              style: TextStyle(color: Colors.white),
                            ),
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
