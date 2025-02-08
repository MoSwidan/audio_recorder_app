import 'package:flutter/material.dart';

class RecordButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isRecording;

  const RecordButton({
    required this.onPressed,
    required this.isRecording,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isRecording ? null : onPressed,
      child: Text(isRecording ? 'Recording...' : 'Record Audio'),
    );
  }
}