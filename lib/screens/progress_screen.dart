import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double _weight = 0;
  int _workoutsCompleted = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _weight = prefs.getDouble('weight') ?? 0;
      _workoutsCompleted = prefs.getInt('workoutsCompleted') ?? 0;
    });
  }

  _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('weight', _weight);
    prefs.setInt('workoutsCompleted', _workoutsCompleted);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Track Progress'),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.green,
      ),
      body: Padding(

        padding: const EdgeInsets.all(16.0),

        child: Column(

          children: [
            Image.asset(
              'assets/progress.png', // Path to your local image
              height: 150,
            ),
            SizedBox(height: 40),

            Card(
              color: isDarkMode ? Colors.grey[800] : Colors.green.shade50,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Weight: ${_weight.toStringAsFixed(1)} kg',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      value: _weight,
                      min: 0,
                      max: 200,
                      divisions: 200,
                      label: _weight.toStringAsFixed(1),
                      activeColor: Colors.green,
                      inactiveColor: Colors.green.shade100,
                      onChanged: (value) {
                        setState(() {
                          _weight = value;
                        });
                        _saveProgress();
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),

            Card(
              color: isDarkMode ? Colors.grey[800] : Colors.green.shade50,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),

              child: Padding(

                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Workouts Completed: $_workoutsCompleted',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _workoutsCompleted++;
                        });
                        _saveProgress();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Complete Workout',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
