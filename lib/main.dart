import 'package:flutter/material.dart';
import 'widgets/record_button.dart';
import 'widgets/play_button.dart';
import 'utils/audio_recorder.dart';

void main() {
  runApp(AudioRecorderApp());
}

class AudioRecorderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Recorder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AudioRecorderScreen(),
    );
  }
}

class AudioRecorderScreen extends StatefulWidget {
  @override
  _AudioRecorderScreenState createState() => _AudioRecorderScreenState();
}

class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
  String? _audioPath;
  bool _isRecording = false;

  void _startRecording() async {
    setState(() {
      _isRecording = true;
    });
    final path = await AudioRecorder.startRecording();
    setState(() {
      _audioPath = path;
      _isRecording = false;
    });
  }

  void _playRecording() {
    if (_audioPath != null) {
      AudioRecorder.playRecording(_audioPath!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Recorder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RecordButton(
              onPressed: _startRecording,
              isRecording: _isRecording,
            ),
            if (_audioPath != null) ...[
              SizedBox(height: 20),
              PlayButton(onPressed: _playRecording),
            ],
          ],
        ),
      ),
    );
  }
}