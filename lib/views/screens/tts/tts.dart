import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/share/social_share.dart';
import 'package:flutter_app/views/screens/tts/text_to_speech_widget.dart';

class TextToSpeech extends StatelessWidget {
  final String text;
  const TextToSpeech({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Row(
          children: [
            TextToSpeechWidget(text: text),
            const Spacer(),
            const SocialShare(sharingMsg: 'check out our website https://turndigital.net/'),
          ],
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
