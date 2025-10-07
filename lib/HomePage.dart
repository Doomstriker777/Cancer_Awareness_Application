import 'package:flutter/material.dart';
import 'types_of_cancer.dart';
import 'cancer_symptoms.dart';
import 'awareness_videos_page.dart';
import 'prevention_tips_page.dart';
import 'quiz_page.dart';
import 'quiz_intro_page.dart';
import 'help_support_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'name': 'Types of Cancer', 'icon': Icons.category},
    {'name': 'Symptoms Checker', 'icon': Icons.health_and_safety},
    {'name': 'Awareness Videos', 'icon': Icons.video_library},
    {'name': 'Prevention Tips', 'icon': Icons.tips_and_updates},
    {'name': 'Awareness Quiz', 'icon': Icons.quiz},
    {'name': 'Help & Support', 'icon': Icons.support},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CanAware")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: Text(
                'CanAware Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ...features.map((feature) {
              return ListTile(
                leading: Icon(feature['icon']),
                title: Text(feature['name']),
                onTap: () {
                  Navigator.pop(context);
                  if (feature['name'] == 'Types of Cancer') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TypesOfCancerPage()),
                    );
                  } else if (feature['name'] == 'Symptoms Checker') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SymptomsCheckerPage()),
                    );
                  } else if (feature['name'] == 'Awareness Videos') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AwarenessVideosPage()),
                    );
                  } else if (feature['name'] == 'Prevention Tips') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PreventionTipsPage()),
                    );
                  } else if (feature['name'] == 'Awareness Quiz') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => QuizIntroPage()),
                    );
                  } else if (feature['name'] == 'Help & Support') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HelpSupportPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${feature['name']} coming soon...')),
                    );
                  }
                },
              );
            }).toList(),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pink.shade100,
              Colors.purple.shade100,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to CanAware',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Spreading knowledge, saving lives.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => TypesOfCancerPage()),
                      );
                    },
                    icon: Icon(Icons.explore),
                    label: Text("Explore Cancer Types"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      elevation: 4,
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
