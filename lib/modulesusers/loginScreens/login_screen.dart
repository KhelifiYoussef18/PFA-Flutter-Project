import 'package:flutter/material.dart';

import 'package:pfa_project/modulesusers/inscription/formula.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _myFormKey = GlobalKey<FormState>();
  var isPassword = true;
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
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
          child: Center(
            child: Form(
              key: _myFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Column(
                        children: [
                          const Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: cUsername,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email.";
                              } else if (!value.contains('@')) {
                                return "Please enter a valid email address.";
                              } else {
                                List<String> emailParts = value.split('@');
                                String domain = emailParts[1];
                                if (!domain.contains('.') ||
                                    domain.endsWith('.')) {
                                  return "Please enter a valid email address.";
                                }
                                List<String> domainParts = domain.split('.');
                                String extension = domainParts[1];
                                if (extension.length < 2 ||
                                    extension.length > 4) {
                                  return "Please enter a valid email address.";
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            controller: cPassword,
                            obscureText: isPassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: isPassword
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off,
                                          color: Colors.teal),
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  }),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your Password.";
                              } else if (value.length < 6) {
                                return "Password length must be more than 6";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_myFormKey.currentState!.validate()) {
                                Navigator.pushReplacementNamed(context, "/home",
                                    arguments: {'user': cUsername.text});
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), // shadow color
                                      spreadRadius:
                                          2, // how much to expand the shadow
                                      blurRadius:
                                          5, // how blurry the shadow should be
                                      offset:
                                          Offset(0, 3), // offset of the shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Center(
                                  child: Text(
                                    "Sign in ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("don'\'t have an account?",
                                  style: TextStyle(color: Colors.white)),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => registration()),
                                    );
                                  },
                                  child: const Text(
                                    'Register Now',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
