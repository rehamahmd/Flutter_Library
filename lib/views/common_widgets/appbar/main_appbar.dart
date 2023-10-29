import 'package:flutter/material.dart';
import 'package:flutter_app/providers/src/theme_provider.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_icon_button.dart';
import 'package:provider/provider.dart';

class MainAppbarProps {
  String? screenTitle;
  String? preScreenTitle;
  double? appbarHeight;
  Function? popAction;
  PreferredSizeWidget? appbarBottom;
  MainAppbarProps({
    this.screenTitle,
    this.preScreenTitle,
    this.appbarHeight,
    this.popAction,
    this.appbarBottom,
  });
}

class MainAppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final MainAppbarProps props;
  const MainAppbarWidget({Key? key, required this.props}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        props.appbarHeight != null ? props.appbarHeight! : 60,
      );
  @override
  State<MainAppbarWidget> createState() => _MainAppbarWidgetState();
}

class _MainAppbarWidgetState extends State<MainAppbarWidget> {
  late ThemeProvider _themeProvider;

  // Actions
  _setThemeMode() {
    _themeProvider.setThemeMode(ThemeMode.values[((_themeProvider.themeMode?.index ?? 0) + 1) % 3]);
  }

  @override
  PreferredSizeWidget build(BuildContext context) {
    _themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      elevation: 0.0,
      title: Text(widget.props.screenTitle ?? ''),
      bottom: widget.props.appbarBottom,
      actions: [
        AppIconButton(
          iconData: _themeProvider.themeMode?.index == 0
              ? Icons.settings_suggest_outlined
              : _themeProvider.themeMode?.index == 1
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
          onPressed: _setThemeMode,
        )
      ],
    );
  }
}
