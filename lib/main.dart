import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/UserInfoScreen.dart';
import 'screens/nutrition_screen.dart';
import 'screens/workout_screen.dart';
import 'screens/progress_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickFit Coach',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/user_info') {
          final userId = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (context) => UserInfoScreen(userId: userId ?? '', userName: ''),
          );
        }
        return null;
      },
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(userId: '', userName: ''),
      },
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
      colorScheme: ColorScheme.light(
        primary: Colors.green[800]!,
        // secondary: Colors.green,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green[800],
      ),
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.grey[200],
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.black54),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      colorScheme: ColorScheme.dark(
        primary: Colors.green[600]!,
        secondary: Colors.green,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green,
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      cardColor: Colors.grey[800],
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white70),
        bodyMedium: TextStyle(color: Colors.white54),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
