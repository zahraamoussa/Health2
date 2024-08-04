import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WorkoutScreen extends StatefulWidget {
  final String userId;

  WorkoutScreen({required this.userId});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<dynamic> _workouts = [];

  @override
  void initState() {
    super.initState();
    _fetchWorkouts();
  }

  Future<void> _fetchWorkouts() async {
    try {
      final response = await http.post(
        Uri.parse('http://healthyplans.atwebpages.com/public_html/get_workouts.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': widget.userId,
        }),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['success']) {
        setState(() {
          _workouts = responseData['workouts'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
        backgroundColor:Colors.green,
      ),
      body: _workouts.isEmpty
          ? Center(child: Text('No workouts available'))
          : ListView.builder(
        itemCount: _workouts.length,
        itemBuilder: (context, index) {
          final workout = _workouts[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 4.0,
            child: ListTile(
              leading: Icon(Icons.fitness_center, color: Colors.green[800]),
              title: Text(workout['workout_name']),
              subtitle: Text('${workout['duration']} minutes\n${workout['instructions']}'),
            ),
          );
        },
      ),
    );
  }
}
