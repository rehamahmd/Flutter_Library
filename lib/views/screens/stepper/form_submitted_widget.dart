import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';

import 'package:provider/provider.dart';

// FOR TEST DATA SUBMITION
class FormSubmittedWidget extends StatelessWidget {
  const FormSubmittedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Form Submitted Successfully"),
          Selector<StepperProvider, SteppeModel>(
              selector: (_, provider) => provider.stepperForm,
              builder: (_, stepperForm, __) {
                return Text(stepperForm.toString());
              }),
          AppButton(
            text: 'Reset',
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => Provider.of<StepperProvider>(context, listen: false).reset(),
          )
        ],
      ),
    );
  }
}
