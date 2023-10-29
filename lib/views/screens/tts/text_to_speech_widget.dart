import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechWidget extends StatefulWidget {
  final String text;
  const TextToSpeechWidget({Key? key, required this.text}) : super(key: key);

  @override
  _TextToSpeechWidgetState createState() => _TextToSpeechWidgetState();
}

class _TextToSpeechWidgetState extends State<TextToSpeechWidget> {
  /// true when convert text to speech
  /// false if not
  bool _playing = false;

  /// true when start process of load text to be converted
  /// false if load end
  ///
  /// note loading appear if text are too long without enter (\n)
  /// so package convert paragraph paragraph and need to be separated with \n
  bool _loading = false;

  /// the offset of word end in [widget.text] which currently converted to speech
  int _offset = 0;
  final FlutterTts _flutterTts = FlutterTts();

  _onPlay() async {
    if (_loading) {
      return;
    }
    if (!await _flutterTts.isLanguageAvailable("ar")) {
      return;
    }
    if (_playing) {
      await _flutterTts.stop();
      _playing = false;
      setState(() {});
      return;
    }
    _loading = true;
    setState(() {});
    // todo replace language code with app code
    await _flutterTts.setLanguage("ar");
    await _flutterTts.speak(widget.text.substring(_offset));
  }

  _onStop() async {
    await _flutterTts.stop();
    _offset = 0;
    _playing = false;
    setState(() {});
  }

  @override
  void initState() {
    _flutterTts.setStartHandler(() {
      setState(() {
        _loading = false;
        _playing = true;
      });
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        _offset = 0;
        _playing = false;
      });
    });

    _flutterTts.setErrorHandler((msg) {
      setState(() {});
    });

    _flutterTts.setProgressHandler((text, start, end, word) {
      _offset = end;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    // _onStop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: _onPlay,
            icon: _loading
                ? CircularProgressIndicator()
                : Icon(_playing ? Icons.pause : Icons.play_arrow)),
        AnimatedSize(
          duration: Duration(milliseconds: 400),
          child: _offset != 0.0
              ? IconButton(onPressed: _onStop, icon: Icon(Icons.stop))
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
