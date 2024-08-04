import 'package:flutter/material.dart';

import 'nutrition_screen.dart';
import 'progress_screen.dart';
import 'workout_screen.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String userId;
  final String userName;

  DashboardScreen({required this.userId, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              TextSpan(
                text: '$userName',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                userName[0],
                style: TextStyle(color: Colors.green),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/user_info',
                arguments: userId,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NutritionScreen(userId: userId),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.restaurant, size: 30, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        'Nutrition Tips',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutScreen(userId: userId),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.fitness_center, size: 30, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        'Workouts',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgressScreen(userId: userId),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.show_chart, size: 30, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        'Progress',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
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
