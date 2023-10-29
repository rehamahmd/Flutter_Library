import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/validator_controller.dart';

import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/views/common_widgets/text_field/app_text_form_field.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

import 'package:provider/provider.dart';

class StepOneBasicInfo extends StatefulWidget {
  StepOneBasicInfo({Key? key}) : super(key: key);

  @override
  State<StepOneBasicInfo> createState() => _StepOneBasicInfoState();
}

class _StepOneBasicInfoState extends State<StepOneBasicInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late StepperProvider _stepperProvider;
  @override
  void initState() {
    super.initState();
    _stepperProvider = Provider.of<StepperProvider>(context, listen: false);
    _stepperProvider.readnationalityListFromJson();
    _stepperProvider.setCurrentFormKey(_formKey);
  }

  _selectNationality(nationality) {
    _stepperProvider.setSelectedNationality(nationality);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextFormField(
              label: "Full Name",
              initialValue: _stepperProvider.stepperForm.fullName,
              textInputType: TextInputType.name,
              validator: (value) => Validator.hasValue(value) ? null : "This Field is Required",
              onSaved: (value) => _stepperProvider.stepperForm.fullName = value,
            ),
            SizedBox(height: AppResponsive.scaleFactor * 15),
            _buildNationalityInput(context),
            SizedBox(height: AppResponsive.scaleFactor * 15),
            _buildNationalIDBasedOnNationality(_stepperProvider),
            SizedBox(height: AppResponsive.scaleFactor * 15),
            AppTextFormField(
              label: "Phone Number",
              initialValue: _stepperProvider.stepperForm.phoneNo?.toString(),
              textInputType: TextInputType.phone,
              validator: (value) => Validator.isPhoneNumber(value) ? null : "Invalid Phone Number",
              onSaved: (value) {
                if (value != null) _stepperProvider.stepperForm.phoneNo = int.tryParse(value);
              },
            ),
            SizedBox(height: AppResponsive.scaleFactor * 15),
            AppTextFormField(
              label: "Email",
              initialValue: _stepperProvider.stepperForm.email,
              textInputType: TextInputType.emailAddress,
              validator: (value) => Validator.isEmail(value) ? null : "Invalid email",
              onSaved: (value) => _stepperProvider.stepperForm.email = value,
            ),
          ],
        ),
      ),
    );
  }

  _buildNationalityInput(context) {
    return Selector<StepperProvider, dynamic>(
        selector: (_, provider) => [
              provider.nationalityStringList,
              provider.nationalityStringList.length,
              provider.stepperForm.nationality
            ],
        builder: (_, data, __) {
          List<String> nationalityStringList = data[0];
          String? selectedNationality = data[2];
          return DropdownButtonFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
            ),
            style: Theme.of(context).textTheme.bodyText1,
            value: selectedNationality,
            icon: Icon(Icons.keyboard_arrow_down),
            items: nationalityStringList.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(),
            onChanged: (String? newValue) {
              _selectNationality(newValue);
            },
          );
        });
  }

  _buildNationalIDBasedOnNationality(StepperProvider _stepperProvider) {
    return Selector<StepperProvider, String?>(
        selector: (_, provider) => provider.stepperForm.nationality,
        builder: (_, nationality, __) {
          if (nationality == 'Egyptian') {
            return AppTextFormField(
              label: "National Id",
              initialValue: _stepperProvider.stepperForm.nationalNo?.toString(),
              textInputType: TextInputType.number,
              validator: (value) {
                if (!Validator.hasValue(value)) {
                  return "This Field Is Required";
                } else if (!Validator.isNumeric(value!)) {
                  return "The field must consist of numbers only";
                } else if (!Validator.isExactNumber(value, 14)) {
                  return "14 digits must be entered";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                if (value != null) _stepperProvider.stepperForm.nationalNo = int.tryParse(value);
              },
            );
          }
          return AppTextFormField(
            label: "Passport Number",
            initialValue: _stepperProvider.stepperForm.passportNo?.toString(),
            textInputType: TextInputType.number,
            validator: (value) => Validator.hasValue(value) ? null : "This Field is Required",
            onSaved: (String? value) {
              if (value != null) _stepperProvider.stepperForm.passportNo = int.tryParse(value);
            },
          );
        });
  }
}
