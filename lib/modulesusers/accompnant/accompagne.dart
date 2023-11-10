import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _numRoomsController = TextEditingController();
  final telController = TextEditingController();
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _numRoomsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Registration for companions'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                    Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1])),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        color: Colors.grey[100],
                        child: TextFormField(
                          controller: _firstNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[100],
                        child: TextFormField(
                          controller: _lastNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.grey[100],
                        child: TextFormField(
                          controller: _ageController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Age',
                              prefixIcon: Icon(Icons.data_saver_on)),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.grey[100],
                        child: TextFormField(
                          controller: _emailController,
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
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.grey[100],
                        child: TextFormField(
                          controller: _numRoomsController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter number of rooms';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Number of Rooms',
                              prefixIcon: Icon(Icons.confirmation_number)),
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
                              controller: telController,
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
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.grey[100],
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Form is valid, process registration
                                final firstName = _firstNameController.text;
                                final lastName = _lastNameController.text;
                                final age = _ageController.text;
                                final email = _emailController.text;
                                final numRooms = _numRoomsController.text;

                                // Do something with the registration data
                                // ...

                                // Clear the form
                                _firstNameController.clear();
                                _lastNameController.clear();
                                _ageController.clear();
                                _emailController.clear();
                                _numRoomsController.clear();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors
                                  .purple, // Set the background color to purple
                            ),
                            child: Text('Submit'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
