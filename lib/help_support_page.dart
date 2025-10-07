import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportPage extends StatelessWidget {
  // Emergency helpline numbers
  final List<Map<String, String>> emergencyContacts = [
    {'name': 'National Cancer Helpline', 'number': '1800111234'},
    {'name': 'Cancer Support Center', 'number': '1800123456'},
  ];

  // Informational resources URLs
  final List<Map<String, String>> infoResources = [
    {'name': 'World Health Organization', 'url': 'https://www.who.int/cancer'},
    {'name': 'American Cancer Society', 'url': 'https://www.cancer.org'},
    {'name': 'Indian Cancer Society', 'url': 'https://indiancancersociety.org'},
  ];

  // Mental health support contacts
  final List<Map<String, String>> mentalHealthSupport = [
    {'name': 'Mental Health Helpline', 'number': '1800456789'},
    {'name': 'Counseling Support', 'number': '1800678901'},
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink[700]),
      ),
    );
  }

  Widget _buildPhoneTile(String name, String number) {
    return ListTile(
      leading: Icon(Icons.phone, color: Colors.pink),
      title: Text(name),
      subtitle: Text(number),
      trailing: Icon(Icons.call, color: Colors.pink),
      onTap: () => _launchURL('tel:$number'),
    );
  }

  Widget _buildWebTile(String name, String url) {
    return ListTile(
      leading: Icon(Icons.link, color: Colors.pink),
      title: Text(name),
      trailing: Icon(Icons.open_in_new, color: Colors.pink),
      onTap: () => _launchURL(url),
    );
  }

  Widget _buildContactSupportButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        icon: Icon(Icons.email),
        label: Text("Contact Support"),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Contact Support'),
              content: SingleChildScrollView(
                child: Text(
                  'Adarsh Kiran\nMobile: 8688013818\nEmail:adarshkiran13@gmail.com',
                  style: TextStyle(height: 1.4),
                ),
              ),
              actions: [
                TextButton(
                  child: Text('Close', style: TextStyle(color: Colors.pink)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help & Support")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Intro Text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "If you or someone you know is affected by cancer, we’re here to help. Below are resources and contacts for emotional, informational, and medical support.",
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Medical Assistance (Placeholder)
            _buildSectionTitle("Medical Assistance"),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: ListTile(
                leading: Icon(Icons.local_hospital, color: Colors.pink),
                title: Text("Find nearby hospitals or oncologists"),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Feature coming soon!")),
                  );
                },
              ),
            ),

            // Emergency Contacts
            _buildSectionTitle("Emergency Contacts"),
            ...emergencyContacts
                .map((contact) =>
                _buildPhoneTile(contact['name']!, contact['number']!))
                .toList(),

            // Mental Health Support
            _buildSectionTitle("Mental Health Support"),
            ...mentalHealthSupport
                .map((contact) =>
                _buildPhoneTile(contact['name']!, contact['number']!))
                .toList(),

            // Informational Resources
            _buildSectionTitle("Informational Resources"),
            ...infoResources
                .map((res) => _buildWebTile(res['name']!, res['url']!))
                .toList(),

            // Contact Us Button
            _buildSectionTitle("Contact Us"),
            _buildContactSupportButton(context),

            SizedBox(height: 20),

            // Disclaimer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                "Disclaimer: CanAware is an educational app and is not a substitute for professional medical advice. Always consult a healthcare provider for medical concerns.",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
