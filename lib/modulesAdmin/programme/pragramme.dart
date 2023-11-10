import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  late String _eventTitle;
  late DateTime _dateEvent;
  late String _location;
  late String _eventTopic;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Text(
                      'Insert Event ',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: Colors.grey[100],
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Event Title',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an event title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _eventTitle = value!;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.grey[100],
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date Event',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a date for the event';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _dateEvent = DateTime.parse(value!);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.grey[100],
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Location',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a location for the event';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _location = value!;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.grey[100],
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Event Topic',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a topic for the event';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _eventTopic = value!;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          color: Colors.grey[100],
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Start Time',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a start time for the event';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _startTime = TimeOfDay.fromDateTime(
                                  DateTime.parse(value!));
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          color: Colors.grey[100],
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'End Time',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an end time for the event';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _endTime = TimeOfDay.fromDateTime(
                                  DateTime.parse(value!));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
//TODO: Add logic to submit form data to backend
    }
  }
}

class DateFormatInputFormatter extends TextInputFormatter {
  final DateFormat format;

  DateFormatInputFormatter({required String format})
      : format = DateFormat(format);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String? oldText = oldValue.text;
    String? newText = newValue.text;

    // If the new value is shorter than the old value, return as is
    if (oldText != null && oldText.length > newText.length) {
      return newValue;
    }

    // Apply the formatter to the new value
    String formatted =
        format.format(format.parse(newText.replaceAll(RegExp('[^0-9]'), '')));

    return newValue.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length));
  }
}
