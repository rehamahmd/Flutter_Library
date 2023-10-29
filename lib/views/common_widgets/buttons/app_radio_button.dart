import 'package:flutter/material.dart';
import 'package:flutter_app/views/styles/styles.dart';

class CustomRadioButtonProps {
  bool isSelected;
  CustomRadioButtonProps({required this.isSelected});
}

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({Key? key, required this.props}) : super(key: key);
  final CustomRadioButtonProps props;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppResponsive.getSize(20),
        width: AppResponsive.getSize(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppResponsive.getSize(10)),
          ),
          border: Border.all(
              width: 1, color: props.isSelected ? AppColors.orange : AppColors.lightGrey),
        ),
        child: Center(
          child: props.isSelected
              ? Container(
                  height: AppResponsive.getSize(12),
                  width: AppResponsive.getSize(12),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppResponsive.getSize(6)),
                    ),
                  ),
                )
              : Container(),
        ));
  }
}
