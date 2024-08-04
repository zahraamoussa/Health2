import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          _buildPage(
            title: 'Welcome to QuickFit Coach',
            description: 'Your personal health and fitness coach, always by your side.',
            image: 'assets/onboarding1.png',
          ),
          _buildPage(
            title: 'Track Your Progress',
            description: 'Monitor your workouts and nutrition with ease.',
            image: 'assets/onboarding2.png',
          ),
          _buildPage(
            title: 'Get Expert Tips',
            description: 'Receive personalized advice to reach your fitness goals.',
            image: 'assets/onboarding3.png',
          ),
        ],
      ),
      bottomSheet: _currentPage == 2
          ? Container(
        color: Colors.green,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      )
          : Container(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Text('Skip', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            TextButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required String title, required String description, required String image}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250),
          SizedBox(height: 40),
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
