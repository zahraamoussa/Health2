import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(QuickFitCoachApp());
}

class QuickFitCoachApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          title: 'QuickFit Coach',
          theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: Brightness.light,
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
              bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            buttonTheme: ButtonThemeData(buttonColor: Colors.green),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
              bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            buttonTheme: ButtonThemeData(buttonColor: Colors.green),
          ),
          themeMode: themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/onboarding': (context) => OnboardingScreen(),
            '/home': (context) => HomeScreen(themeNotifier: _themeNotifier),
          },            debugShowCheckedModeBanner: false,

        );
      },
    );
  }
}
