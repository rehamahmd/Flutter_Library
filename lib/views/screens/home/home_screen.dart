import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_icon_button.dart';
import 'package:flutter_app/views/screens/panorama/panorama_screen.dart';
import 'package:flutter_app/views/screens/tabs/date_time_picker_tab.dart';
import 'package:flutter_app/views/screens/tabs/font_resizing_tab.dart';
import 'package:flutter_app/views/screens/tabs/gallery_tab.dart';
import 'package:flutter_app/views/screens/tabs/lazy_loading_tab.dart';
import 'package:flutter_app/views/screens/tabs/listing_with_shimmer.dart';
import 'package:flutter_app/views/screens/tabs/maps_tab.dart';
import 'package:flutter_app/views/screens/tabs/sliders_tab.dart';
import 'package:flutter_app/views/screens/tabs/stepper_tab.dart';
import 'package:flutter_app/views/screens/tabs/text_to_speech_tab.dart';
import 'package:flutter_app/views/screens/tabs/timeline_tab.dart';

import 'package:flutter_app/views/screens/tabs/user_cycle_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/views/common_widgets/appbar/main_appbar.dart';
import 'package:flutter_app/views/screens/3D/3D_model_viewer/3D_model_viewer_screen.dart';

class HomeScreen extends StatelessWidget {
  late ThemeProvider _themeProvider;
  final List<String> _labels = [
    "Sliders",
    "Gallery",
    "Lazy Loading",
    "Listing simmer Loading",
    "Maps",
    "Timeline",
    "User Cycle",
    "Stepper",
    "Text To Speech",
    "Date Time Picker",
    "Font Resizing",
  ];
  final _tabsWidgets = const [
    SlidersTab(),
    GalleryTab(),
    LazyLoadingTab(),
    ListingWithShimmerTab(),
    MapsTab(),
    TimelineTab(),
    UserCycleTab(),
    StepperTab(),
    TextToSpeechTab(),
    DateAndTimePickerTab(),
    FontResizingTab(),
  ];
  // Actions
  _setThemeMode() {
    _themeProvider.setThemeMode(ThemeMode.values[((_themeProvider.themeMode?.index ?? 0) + 1) % 3]);
  }

  @override
  Widget build(BuildContext context) {
    _themeProvider = Provider.of<ThemeProvider>(context);
    PreferredSizeWidget appbarBottom = TabBar(
        indicatorColor: Theme.of(context).colorScheme.onPrimary,
        isScrollable: true,
        tabs: _labels
            .map((e) => Tab(
                  text: e,
                ))
            .toList());
    return SafeArea(
      child: DefaultTabController(
        length: _labels.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: const Text("FB Library"),
            bottom: appbarBottom,
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
          ),
          body: TabBarView(children: _tabsWidgets),
        ),
      ),
    );
  }
}
