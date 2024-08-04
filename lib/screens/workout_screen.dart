import 'package:flutter/material.dart';
import 'data.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plans'),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.green,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            for (var workout in predefinedWorkouts)
              Card(
                color: isDarkMode ? Colors.grey[800] : Colors.green.shade50,
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    leading: Icon(Icons.fitness_center, color: isDarkMode ? Colors.white : Colors.green),
                    title: Text(
                      workout.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      '${workout.exercises.join(', ')} (${workout.duration} mins)',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
