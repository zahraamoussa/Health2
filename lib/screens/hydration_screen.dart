import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HydrationTrackerScreen extends StatefulWidget {
  @override
  _HydrationTrackerScreenState createState() => _HydrationTrackerScreenState();
}

class _HydrationTrackerScreenState extends State<HydrationTrackerScreen> {
  int _totalWaterIntake = 0; // in milliliters
  int _dailyGoal = 2000; // in milliliters
  final _goalController = TextEditingController();

  void _addWater(int amount) {
    setState(() {
      _totalWaterIntake += amount;
    });
  }

  void _setDailyGoal(int goal) {
    setState(() {
      _dailyGoal = goal;
      _totalWaterIntake = 0; // Reset total water intake when the goal is updated
    });
    // Save the goal to persistent storage if needed
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final appBarColor = isDarkMode ? Colors.black : Colors.green;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hydration Tracker',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/water.png',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Total Intake: $_totalWaterIntake mL',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Daily Goal: $_dailyGoal mL',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _goalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Update Daily Goal (mL)',
labelStyle: TextStyle(color: Colors.green),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              onSubmitted: (value) {
                final newGoal = int.tryParse(value) ?? _dailyGoal;
                _setDailyGoal(newGoal);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _addWater(250);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: Text(
                'Add 250 mL',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                _addWater(500);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: Text(
                'Add 500 mL',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
