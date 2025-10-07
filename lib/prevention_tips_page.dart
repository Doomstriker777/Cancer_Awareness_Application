import 'package:flutter/material.dart';

class PreventionTipsPage extends StatelessWidget {
  final Map<String, List<String>> cancerTips = {
    'Skin Cancer': [
      "Avoid excessive sun exposure.",
      "Wear sunscreen with at least SPF 30.",
      "Wear protective clothing and hats.",
      "Avoid tanning beds.",
      "Check your skin monthly for unusual moles.",
      "Seek shade during peak sun hours (10 AM - 4 PM).",
      "Use sunglasses that block UV rays.",
      "Avoid sunburns, even one severe burn can increase risk.",
      "Apply sunscreen every 2 hours, or after swimming/sweating.",
      "Consult a dermatologist for suspicious skin changes.",
    ],
    'Breast Cancer': [
      "Perform regular self-examinations monthly.",
      "Maintain a healthy weight.",
      "Exercise regularly.",
      "Limit alcohol consumption.",
      "Avoid smoking.",
      "Eat a balanced diet rich in fruits and vegetables.",
      "Breastfeed if possible.",
      "Know your family history and discuss with your doctor.",
      "Get regular mammograms as recommended.",
      "Avoid exposure to radiation and environmental pollution.",
    ],
    'Lung Cancer': [
      "Avoid smoking and secondhand smoke.",
      "Test your home for radon exposure.",
      "Avoid exposure to carcinogens at work.",
      "Maintain a healthy diet.",
      "Exercise regularly.",
      "Limit alcohol intake.",
      "Avoid air pollution when possible.",
      "Get screened if you’re at high risk.",
      "Wear masks when exposed to dust or chemicals.",
      "Seek medical advice if experiencing persistent cough or chest pain.",
    ],
    // Add other cancers with 10+ tips here similarly
    'Leukemia': [
      "Avoid exposure to benzene and other chemicals.",
      "Avoid unnecessary radiation exposure.",
      "Maintain a healthy lifestyle.",
      "Eat plenty of fruits and vegetables.",
      "Avoid tobacco products.",
      "Get regular health check-ups.",
      "Practice good hygiene to prevent infections.",
      "Manage stress effectively.",
      "Limit alcohol consumption.",
      "Discuss family history with your doctor.",
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prevention Tips')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: cancerTips.entries.map((entry) {
          final cancer = entry.key;
          final tips = entry.value;

          return Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cancer,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[700],
                  ),
                ),
                SizedBox(height: 12),
                ...List.generate(tips.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '${index + 1}. ${tips[index]}',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
