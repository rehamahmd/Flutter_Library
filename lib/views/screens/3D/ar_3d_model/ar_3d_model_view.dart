import 'dart:io';

import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';

class AR3DModelView extends StatelessWidget {
  const AR3DModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (Platform.isAndroid) {
            AndroidIntent intent = const AndroidIntent(
              action: 'action_view',
              data:
                  'https://arvr.google.com/scene-viewer/1.0?file=https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Avocado/glTF/Avocado.gltf',
              package: "com.google.android.googlequicksearchbox",
            );
            await intent.launch();
          }
        },
        child: const Text("3D Model + Ar"));
  }
}
