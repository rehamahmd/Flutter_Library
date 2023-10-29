import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/sliders/slider_1/slider_1.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

class SliderOneView extends StatefulWidget {
  SliderOneView({Key? key}) : super(key: key);

  @override
  State<SliderOneView> createState() => _SliderOneViewState();
}

class _SliderOneViewState extends State<SliderOneView> {
  int itemNumbersShowInScreen = 1;
  changeShowingItem(value) {
    itemNumbersShowInScreen = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ItemsSelectionButtons(
          showingItem: itemNumbersShowInScreen,
          changeShowingItem: changeShowingItem,
        ),
        SliderOne(
          props: SliderOneProps(
            itemNumbersShowInScreen: itemNumbersShowInScreen,
            imagesList: SlidersData.imgList,
          ),
        ),
      ],
    );
  }
}

class _ItemsSelectionButtons extends StatelessWidget {
  final int showingItem;
  final Function changeShowingItem;
  const _ItemsSelectionButtons({Key? key, this.showingItem = 1, required this.changeShowingItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.getSize(200),
      child: Row(
        children: [1, 2, 3, 4]
            .map((e) => GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: AppResponsive.getSize(40),
                    height: AppResponsive.getSize(40),
                    decoration: BoxDecoration(
                        color: e == showingItem ? AppColors.orange : Colors.white,
                        border: Border.all(width: 1, color: AppColors.orange),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        )),
                    child: Center(
                      child: Text(e.toString()),
                    ),
                  ),
                  onTap: () => changeShowingItem(e),
                ))
            .toList(),
      ),
    );
  }
}
