import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';

class AudioRecorder {
  static final AudioPlayer _audioPlayer = AudioPlayer();
  static final Record _audioRecorder = Record();

  static Future<String> startRecording() async {
    final path = 'F:/TestFlutterVSCode/audio_recorder_app/records/rec1.m4a'; 
    await _audioRecorder.start(path: path);
    return path;
  }

  static Future<void> stopRecording() async {
    await _audioRecorder.stop();
  }

  static Future<void> playRecording(String path) async {
    await _audioPlayer.play(DeviceFileSource(path));
  }
}