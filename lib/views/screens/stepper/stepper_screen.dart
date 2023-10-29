import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/views/screens/stepper/form_submitted_widget.dart';
import 'package:flutter_app/views/screens/stepper/stepper_body.dart';
import 'package:flutter_app/views/screens/stepper/stepper_footer.dart';
import 'package:flutter_app/views/screens/stepper/stepper_header.dart';
import 'package:flutter_app/views/styles/styles.dart';

import 'package:provider/provider.dart';

class StepperScreen extends StatefulWidget {
  StepperScreen({Key? key}) : super(key: key);

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  late final List<FormStep> steps;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    steps = Provider.of<StepperProvider>(context, listen: false).steps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Selector<StepperProvider, dynamic>(
            selector: (_, provider) => {
                  'currentStep': provider.currentStepIndex,
                  'isSubmittedForm': provider.isSubmittedForm
                },
            builder: (_, state, __) {
              int currentStepIndex = state['currentStep'];
              bool isSubmittedForm = state['isSubmittedForm'];
              if (isSubmittedForm) return FormSubmittedWidget();
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.scaleFactor * 20,
                    vertical: AppResponsive.scaleFactor * 30),
                child: Column(
                  children: [
                    StepperHeader(
                      totalSteps: steps,
                      currentStepIndex: currentStepIndex,
                    ),
                    Expanded(
                      child: StepperBody(
                        currentIndex: currentStepIndex,
                        steps: steps,
                      ),
                    ),
                    StepperFooter()
                  ],
                ),
              );
            }));
  }
}

class FormStep {
  int id;
  String title;
  Widget stepWidget;

  FormStep({
    required this.id,
    required this.title,
    required this.stepWidget,
  });
}
