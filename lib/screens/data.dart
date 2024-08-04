class NutritionTip {
  final String title;
  final String description;

  NutritionTip({required this.title, required this.description});
}

final List<NutritionTip> predefinedTips = [
  NutritionTip(title: 'Stay Hydrated', description: 'Drink at least 8 glasses of water a day.'),
  NutritionTip(title: 'Balanced Diet', description: 'Include a variety of foods in your diet.'),
  NutritionTip(title: 'Reduce Sugar Intake', description: 'Limit sugary drinks and snacks.'),
  NutritionTip(title: 'Eat More Vegetables', description: 'Aim for at least 5 servings of vegetables daily.'),
  // Add more tips here
];

class Workout {
  final String name;
  final List<String> exercises;
  final int duration; // in minutes

  Workout({required this.name, required this.exercises, required this.duration});
}

final List<Workout> predefinedWorkouts = [
  Workout(name: 'Full Body Workout', exercises: ['Push-ups', 'Squats', 'Burpees'], duration: 30),
  Workout(name: 'Cardio Blast', exercises: ['Jumping Jacks', 'High Knees', 'Mountain Climbers'], duration: 20),
  Workout(name: 'Strength Training', exercises: ['Deadlifts', 'Bench Press', 'Rows'], duration: 45),
  Workout(name: 'Yoga Stretch', exercises: ['Sun Salutations', 'Warrior Poses', 'Tree Pose'], duration: 40),
  // Add more workouts here
];
