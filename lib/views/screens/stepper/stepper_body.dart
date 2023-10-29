import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/stepper/stepper_screen.dart';

class StepperBody extends StatefulWidget {
  final List<FormStep> steps;
  final int currentIndex;

  const StepperBody({
    Key? key,
    required this.steps,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<StepperBody> createState() => _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // prevent it to do it programmatically
        itemCount: widget.steps.length,
        itemBuilder: (context, index) {
          FormStep currentStep = widget.steps[widget.currentIndex - 1];
          return Center(
            child: currentStep.stepWidget,
          );
        });
  }
}
