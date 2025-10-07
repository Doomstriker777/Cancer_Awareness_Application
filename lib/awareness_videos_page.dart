import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AwarenessVideosPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Understanding Cancer',
      'description': 'A basic overview of what cancer is and how it affects the body.',
      'url': 'https://www.youtube.com/watch?v=LEpTTolebqo',
    },
    {
      'title': 'Early Detection Saves Lives',
      'description': 'Learn about signs and the importance of early diagnosis.',
      'url': 'https://www.youtube.com/watch?v=2xZ6Ke5VpaY',
    },
    {
      'title': 'Healthy Lifestyle Tips',
      'description': 'Daily habits that may help reduce cancer risk.',
      'url': 'https://www.youtube.com/watch?v=75qN1W6SoY8',
    },
  ];

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Awareness Videos')),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.ondemand_video, color: Colors.pink),
              title: Text(video['title'] ?? ''),
              subtitle: Text(video['description'] ?? ''),
              trailing: Icon(Icons.play_circle_outline),
              onTap: () => _launchURL(video['url']!),
            ),
          );
        },
      ),
    );
  }
}
