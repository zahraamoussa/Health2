import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
// Update this to your project's import path
import 'package:untitled8/main.dart';
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(QuickFitCoachApp()); // Ensure this matches your actual app class name

    // Verify that the app starts with a certain state
    // You might need to adjust these expectations based on your actual widget setup
    expect(find.text('Workout Plans'), findsOneWidget);
    expect(find.text('Nutrition Tips'), findsOneWidget);
    expect(find.text('Track Progress'), findsOneWidget);

    // Example of interacting with the app: toggling the theme
    await tester.tap(find.byIcon(Icons.nightlight_round)); // Adjust based on your icon
    await tester.pump(); // Rebuilds the widget tree

    // Verify changes based on interactions
    // Example: Check if the theme toggled (you may need to verify the changes in a different way depending on your app's logic)
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
  });
}
