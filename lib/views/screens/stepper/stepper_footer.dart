import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';

import 'package:provider/provider.dart';

class StepperFooter extends StatelessWidget {
  const StepperFooter({Key? key}) : super(key: key);

  _moveNext(value, context) {
    Provider.of<StepperProvider>(context, listen: false).moveNext(++value);
  }

  _moveBack(value, context) {
    Provider.of<StepperProvider>(context, listen: false).moveBack(--value);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<StepperProvider, int>(
        selector: (_, provider) => provider.currentStepIndex,
        builder: (_, currentStepIndex, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (currentStepIndex > 1)
                AppButton(
                  text: 'Back',
                  color: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () => _moveBack(currentStepIndex, context),
                )
              else
                SizedBox.shrink(),
              Selector<StepperProvider, bool>(
                  selector: (_, provider) => provider.isLastStep,
                  builder: (_, isLastStep, __) {
                    return AppButton(
                      text: isLastStep ? 'Submit' : 'Next',
                      color: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () => _moveNext(currentStepIndex, context),
                    );
                  })
            ],
          );
        });
  }
}
