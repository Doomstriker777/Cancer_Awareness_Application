import 'package:flutter/material.dart';

class TypesOfCancerPage extends StatelessWidget {
  final List<Map<String, String>> cancers = [
    {
      'name': 'Breast Cancer',
      'description':
      'Breast cancer is a disease in which cells in the breast grow out of control. It is most common in women, but men can develop it too.',
      'details':
      'Breast cancer starts in the breast tissue, most often in the ducts or lobules. Risk factors include genetics, hormonal factors, and age. Treatments include surgery, radiation, chemotherapy, and hormone therapy. Regular screening and early detection greatly improve outcomes.'
    },
    {
      'name': 'Lung Cancer',
      'description':
      'Lung cancer begins in the lungs and is often linked to smoking or pollution.',
      'details':
      'Lung cancer is mainly of two types: small cell and non-small cell. Symptoms include coughing up blood, chest pain, and shortness of breath. Smoking is the leading cause. Treatments may include surgery, radiation therapy, targeted drug therapy, or immunotherapy.'
    },
    {
      'name': 'Prostate Cancer',
      'description':
      'Affects the prostate gland in men and usually grows slowly.',
      'details':
      'Prostate cancer often shows no symptoms in early stages. Advanced stages can cause urinary issues, pain, or erectile dysfunction. PSA blood tests and digital rectal exams are used for screening. Treatments include active surveillance, radiation, and surgery.'
    },
    {
      'name': 'Skin Cancer',
      'description':
      'Caused by UV exposure; can often be treated if caught early.',
      'details':
      'There are three major types: basal cell carcinoma, squamous cell carcinoma, and melanoma. Look for changes in moles or new skin growths. Protecting skin from UV radiation is the best prevention.'
    },
    {
      'name': 'Colorectal Cancer',
      'description':
      'Starts in the colon or rectum; screening is very effective.',
      'details':
      'Colorectal cancer develops from polyps in the colon or rectum. Symptoms include blood in stool, weight loss, and fatigue. Colonoscopy is a key tool for both prevention and early diagnosis. Lifestyle changes can help lower risk.'
    },
    {
      'name': 'Leukemia',
      'description':
      'Cancer of blood-forming tissues including bone marrow.',
      'details':
      'Leukemia affects white blood cells and disrupts the body’s ability to fight infection. It can be acute or chronic. Symptoms include frequent infections, anemia, and bleeding. Chemotherapy and bone marrow transplants are common treatments.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Types of Cancer')),
      body: ListView.builder(
        itemCount: cancers.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final cancer = cancers[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.local_hospital, color: Colors.pink, size: 36),
                    title: Text(
                      cancer['name']!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        cancer['description']!,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CancerDetailPage(
                              title: cancer['name']!,
                              details: cancer['details']!,
                            ),
                          ),
                        );
                      },
                      child: Text("Learn More", style: TextStyle(color: Colors.pink)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CancerDetailPage extends StatelessWidget {
  final String title;
  final String details;

  CancerDetailPage({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          details,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}
