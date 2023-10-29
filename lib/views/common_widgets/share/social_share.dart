import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_icon_button.dart';
import 'package:share_plus/share_plus.dart';

class SocialShare extends StatelessWidget {
  final String sharingMsg;
  const SocialShare({Key? key, required this.sharingMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      iconData: Icons.share,
      onPressed: () {
        Share.share(sharingMsg);
      },
    );
  }
}
