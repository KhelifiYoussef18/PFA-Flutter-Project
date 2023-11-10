import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pfa_project/modulesAdmin/programme/pragramme.dart';

class SessionInsert extends StatefulWidget {
  const SessionInsert({Key? key}) : super(key: key);

  @override
  State<SessionInsert> createState() => _SessionInsertState();
}

class _SessionInsertState extends State<SessionInsert> {
  TextEditingController roomcontroler = TextEditingController();
  TextEditingController IdSession = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;
  late String selectedOption = 'Option 1';
  late String selectedOption2 = 'Option 1';

  Widget buildIdSessionFormField() {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      child: Row(
        children: [
          const Text(
            'IdSession:',
            style: TextStyle(fontSize: 15.0),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextFormField(
              controller: IdSession,
              decoration: InputDecoration(
                hintText: 'Enter id session',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'ID Session',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThemeSessionDropdown() {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      child: Row(
        children: [
          const Text(
            'Theme Session :',
            style: TextStyle(fontSize: 15.0),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: DropdownButton<String>(
              value: selectedOption,
              items: const [
                DropdownMenuItem(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                DropdownMenuItem(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                DropdownMenuItem(
                  value: 'Option 3',
                  child: Text('Option 3'),
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
    );
  }

  Widget buildThemeSessionChair() {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      child: Row(
        children: [
          const Text(
            'SessionChair :',
            style: TextStyle(fontSize: 15.0),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: DropdownButton<String>(
              value: selectedOption2,
              items: const [
                DropdownMenuItem(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                DropdownMenuItem(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                DropdownMenuItem(
                  value: 'Option 3',
                  child: Text('Option 3'),
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
    );
  }

  Widget buildRoomSessionDropdown() {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      child: Row(
        children: [
          const Text(
            'Room Session :',
            style: TextStyle(fontSize: 15.0),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              controller: roomcontroler,
              keyboardType: TextInputType.number,
              maxLength: 2,
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
    );
  }

  void _selectTimeRange(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      if (startTime == null) {
        startTime = picked;
        timeController.text = '${startTime!.format(context)}-';
      } else {
        endTime = picked;
        timeController.text =
            '${startTime!.format(context)}-${endTime!.format(context)}';
      }
    }
  }

  Widget buildTimeSessionDropdown() {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      child: Row(
        children: [
          const Text(
            'time Session :',
            style: TextStyle(fontSize: 15.0),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              onTap: () => _selectTimeRange(context),
              readOnly: true, // Prevents the user from typing in the TextField
              controller: timeController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
                hintText: 'Select a time range',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023, 12, 31),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            accentColor: Colors.blue,
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedDate = picked;
      dateController.text =
          DateFormat('EEEE, dd/MM/yyyy').format(selectedDate!);
    }
  }

  Widget builddateSessionDropdown() {
    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      child: Row(
        children: [
          const Text(
            'date Session :',
            style: TextStyle(fontSize: 15.0),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              onTap: () => _selectDate(context),
              readOnly: true, // Prevents the user from typing in the TextField
              controller: dateController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
                hintText: 'Select a date',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Insert Session ',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                buildIdSessionFormField(),
                const SizedBox(height: 20.0),
                buildThemeSessionDropdown(),
                const SizedBox(
                  height: 20.0,
                ),
                buildThemeSessionChair(),
                const SizedBox(height: 20.0),
                buildRoomSessionDropdown(),
                const SizedBox(height: 20.0),
                buildTimeSessionDropdown(),
                const SizedBox(height: 20.0),
                builddateSessionDropdown(),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('add session'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
