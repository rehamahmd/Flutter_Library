import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/stepper/stepper_screen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepperHeader extends StatelessWidget {
  final List<FormStep> totalSteps;
  final int currentStepIndex;
  const StepperHeader({
    Key? key,
    required this.totalSteps,
    required this.currentStepIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormStep currentStep = totalSteps[currentStepIndex - 1];
    FormStep? nextStep =
        currentStepIndex > totalSteps.length - 1 ? null : totalSteps[currentStepIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircularStepProgressIndicator(
            totalSteps: totalSteps.length,
            currentStep: currentStepIndex,
            stepSize: 6,
            selectedColor: Theme.of(context).colorScheme.primary,
            unselectedColor: Colors.grey[200],
            padding: 0,
            width: 70,
            height: 70,
            selectedStepSize: 6,
            roundedCap: (_, __) => true,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(currentStepIndex.toString()),
                  Text(" of "),
                  Text(totalSteps.length.toString()),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(currentStep.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                RichText(
                  text: TextSpan(
                    text: nextStep != null ? 'Next:' : '',
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: nextStep != null ? nextStep.title : '',
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
