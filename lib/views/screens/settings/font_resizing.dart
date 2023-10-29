import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/providers/src/settings_provider.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_radio_button.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';
import 'package:provider/provider.dart';

class FontResizing extends StatelessWidget {
  // user Actions
  _setFontSize(double fontsizeScale, context) async {
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(fontsizeScale);
    await Provider.of<SettingsProvider>(context, listen: false).setTextScaleFactor(fontsizeScale);
  }

  @override
  Widget build(BuildContext context) {
    var fonts = [
      {'title': 'Small', 'scale': 0.8},
      {'title': 'Normal', 'scale': 1.0},
      {'title': 'Large', 'scale': 1.2},
      {'title': 'Larger', 'scale': 1.5},
    ];
    return Scaffold(
      body: Selector<SettingsProvider, double>(
          selector: (_, provider) => provider.textScaleFactor,
          builder: (_, textScaleFactor, __) {
            return SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: AppResponsive.getSize(4)),
                ...fonts
                    .map(
                      (e) => FontSizeContainer(
                        font: e,
                        setFontSize: _setFontSize,
                        textScaleFactor: textScaleFactor,
                      ),
                    )
                    .toList(),
                SizedBox(height: AppResponsive.getSize(40)),
                FontDemoText(textScaleFactor: textScaleFactor),
              ]),
            );
          }),
    );
  }
}

class FontSizeContainer extends StatelessWidget {
  final Function setFontSize;
  final Map font;
  final double textScaleFactor;

  const FontSizeContainer(
      {Key? key, required this.font, required this.setFontSize, required this.textScaleFactor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setFontSize(font['scale'], context),
      child: Card(
        elevation: .1,
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.getSize(16)),
          height: AppResponsive.getSize(54.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                font['title'],
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              CustomRadioButton(
                props: CustomRadioButtonProps(isSelected: font['scale'] == textScaleFactor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FontDemoText extends StatelessWidget {
  final double textScaleFactor;
  const FontDemoText({Key? key, required this.textScaleFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        ' Demo Text For Font Selection',
        style: TextStyle(fontSize: 16 * textScaleFactor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
