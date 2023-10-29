import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/tts/tts.dart';
import 'package:flutter_app/views/ui_dummy_data/tts_text.dart';

class TextToSpeechTab extends StatelessWidget {
  const TextToSpeechTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextToSpeech(text: TTsText.arabicText);
  }
}
