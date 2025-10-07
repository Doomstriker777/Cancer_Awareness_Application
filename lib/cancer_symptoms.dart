import 'package:flutter/material.dart';
import 'symptom_detail_page.dart';

class SymptomsCheckerPage extends StatelessWidget {
  final Map<String, List<String>> cancerSymptoms = {
    'Breast Cancer': ['Lump in the breast', 'Nipple discharge', 'Dimpling skin'],
    'Lung Cancer': ['Persistent cough', 'Chest pain', 'Shortness of breath'],
    'Skin Cancer': ['Unusual mole', 'Itchy or bleeding spots', 'Skin changes'],
    'Colon Cancer': ['Blood in stool', 'Unexplained weight loss', 'Fatigue'],
    'Prostate Cancer': ['Frequent urination', 'Pelvic pain', 'Difficulty urinating'],
    'Leukemia': ['Frequent infections', 'Unexplained bruising or bleeding', 'Chronic fatigue', 'Swollen lymph nodes'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Symptoms Checker')),
      body: ListView.builder(
        itemCount: cancerSymptoms.keys.length,
        itemBuilder: (context, index) {
          String cancer = cancerSymptoms.keys.elementAt(index);
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.pink),
              title: Text(cancer),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SymptomDetailPage(
                      cancerType: cancer,
                      symptoms: cancerSymptoms[cancer]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
