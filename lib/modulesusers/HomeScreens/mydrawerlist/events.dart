import 'package:flutter/cupertino.dart';

class events extends StatefulWidget {
  const events({Key? key}) : super(key: key);

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Event {
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isOpen;

  Event({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.isOpen,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      startTime: TimeOfDay.fromDateTime(DateTime.parse(json['startTime'])),
      endTime: TimeOfDay.fromDateTime(DateTime.parse(json['endTime'])),
      isOpen: json['isOpen'],
    );
  }
}

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    final response = await http.get(Uri.parse('http://localhost:3000/getprogramme/programme/programme'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        _events = jsonData.map((json) => Event.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to fetch events from the server');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _events[index].title,
                  style: TextStyle(fontSize: 24),
),
SizedBox(height: 8),
Text(
'Start date: ${_events[index].startDate}',
style: TextStyle(fontSize: 16),
),
SizedBox(height: 8),
Text(
'End date: ${_events[index].endDate}',
style: TextStyle(fontSize: 16),
),
SizedBox(height: 8),
Text(
'Start time: ${_events[index].startTime.format(context)}',
style: TextStyle(fontSize: 16),
),
SizedBox(height: 8),
Text(
'End time: ${_events[index].endTime.format(context)}',
style: TextStyle(fontSize: 16),
),
SizedBox(height: 8),
Text(
  '${_events[index].isOpen ? 'Open' : 'Closed'}',
  style: TextStyle(
    fontSize: 16,
    color: _events[index].isOpen ? Colors.green : Colors.red,
  ),
)
],
),
);
},
),
);
}
}
*/
     
