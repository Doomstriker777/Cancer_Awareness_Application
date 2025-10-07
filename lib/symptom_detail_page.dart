import 'package:flutter/material.dart';

class SymptomDetailPage extends StatelessWidget {
  final String cancerType;
  final List<String> symptoms;

  SymptomDetailPage({required this.cancerType, required this.symptoms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$cancerType Symptoms')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Common symptoms of $cancerType:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: symptoms.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: Icon(Icons.warning_amber, color: Colors.pink),
                      title: Text(symptoms[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Replace with navigation to a detail page or external link later
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('More info on $cancerType coming soon...')),
                  );
                },
                icon: Icon(Icons.info_outline),
                label: Text('Learn More'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
