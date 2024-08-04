import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'workout_screen.dart';
import 'nutrition_screen.dart';
import 'progress_screen.dart';
import 'hydration_screen.dart';

class HomeScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  HomeScreen({required this.themeNotifier});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? true;
      widget.themeNotifier.value = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  _toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
      prefs.setBool('isDarkMode', _isDarkMode);
      widget.themeNotifier.value = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: _toggleTheme,
            tooltip: _isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Semantics(
              label: 'QuickFit Coach Logo',
              child: Image.asset(
                'assets/logoAppBar.png',
                height: 40,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'QuickFit Coach',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.grey[800] : Colors.green,
                ),
                child: Text(
                  'Click Here!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 60),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16.0),
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: <Widget>[
                    _buildCard(
                      context,
                      Icons.fitness_center,
                      'Workout Plans',
                      WorkoutScreen(),
                      isDarkMode,
                    ),
                    _buildCard(
                      context,
                      Icons.restaurant,
                      'Nutrition Tips',
                      NutritionScreen(),
                      isDarkMode,
                    ),
                    _buildCard(
                      context,
                      Icons.timeline,
                      'Track Progress',
                      ProgressScreen(),
                      isDarkMode,
                    ),
                    _buildCard(
                      context,
                      Icons.local_drink,
                      'Hydration Tracker',
                      HydrationTrackerScreen(),
                      isDarkMode,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )


    );
  }

  Widget _buildCard(
      BuildContext context,
      IconData icon,
      String label,
      Widget destinationScreen,
      bool isDarkMode,
      ) {
    return Semantics(
      label: 'Go to $label',
      child: Card(
        color: isDarkMode ? Colors.grey[800] : Colors.green.shade50,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationScreen),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icon, size: 40, color: isDarkMode ? Colors.white : Colors.black),
                SizedBox(height: 10),
                Text(
                  label,
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
