import 'package:flutter/material.dart';

void main() {
  runApp(const YTdownloader());
}

class YTdownloader extends StatelessWidget {
  const YTdownloader({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  String videoURL = '';

  getlink(String url) {
    if (url.contains('?v=')) {
      url.split('?v=');
      String id = url.split('?v=')[1];

      setState(() {
        String thumbnail = 'https://img.youtube.com/vi/$id/0.jpg';
        videoURL = thumbnail;
      });
    } else {
      if (url.contains('?si=')) {
        url.split('?si=');
        String id = url.split('?si=')[0].split('/')[3];

        setState(() {
          String thumbnail = 'https://img.youtube.com/vi/$id/0.jpg';
          videoURL = thumbnail;
        });
      }
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YT Download')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 300,
              child: TextFormField(
                  textAlign: TextAlign.center, controller: _controller),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  getlink(_controller.text);
                  _controller.clear();
                },
                child: const Text('Show Thumbnail')),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: 400,
              child: Image.network(videoURL),
            )
          ],
        ),
      ),
    );
  }
}
