import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled9/main.dart';  // Ensure this path is correct and points to the file where QuickFitCoachApp is defined

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create the theme notifier
    final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app starts with a certain state
    expect(find.text('Workout Plans'), findsOneWidget);
    expect(find.text('Nutrition Tips'), findsOneWidget);
    expect(find.text('Track Progress'), findsOneWidget);

    // Interact with the app: toggling the theme
    await tester.tap(find.byIcon(Icons.nightlight_round)); // Adjust based on your icon
    await tester.pump(); // Rebuild the widget tree

    // Verify changes based on interactions
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
  });
}
