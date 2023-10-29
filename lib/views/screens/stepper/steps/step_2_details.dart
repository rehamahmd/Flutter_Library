import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/validator_controller.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/views/common_widgets/text_field/app_text_form_field.dart';
import 'package:provider/provider.dart';

class StepTwoDetails extends StatefulWidget {
  StepTwoDetails({Key? key}) : super(key: key);

  @override
  State<StepTwoDetails> createState() => _StepTwoDetailsState();
}

class _StepTwoDetailsState extends State<StepTwoDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Provider.of<StepperProvider>(context, listen: false).setCurrentFormKey(_formKey);
  }

  @override
  Widget build(BuildContext context) {
    StepperProvider _stepperProvider = Provider.of<StepperProvider>(context, listen: false);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextFormField(
              label: "The return from the idea",
              initialValue: _stepperProvider.stepperForm.returnOfTheIdea,
              length: 100,
              textInputType: TextInputType.multiline,
              validator: (String? value) => Validator.isExceedMinChars(20, value)
                  ? null
                  : "The minimum number of characters is 20",
              onSaved: (value) {
                _stepperProvider.stepperForm.returnOfTheIdea = value;
              },
            ),
            AppTextFormField(
              label: "Explain the idea",
              initialValue: _stepperProvider.stepperForm.ideaExplaination,
              length: 200,
              textInputType: TextInputType.multiline,
              validator: (String? value) => Validator.isExceedMinChars(40, value)
                  ? null
                  : "The minimum number of characters is 40",
              onSaved: (value) {
                _stepperProvider.stepperForm.ideaExplaination = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
