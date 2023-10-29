import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/validator_controller.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';
import 'package:flutter_app/views/common_widgets/loaders/loading_manager.dart';
import 'package:flutter_app/views/common_widgets/text_field/app_text_form_field.dart';
import 'package:flutter_app/views/router/router.dart';
import 'package:go_router/go_router.dart';

import 'forget_password_screen.dart';

class VerifyEmailPage extends StatefulWidget {
  static final String id = "/verify-email";
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late Size _size;
  bool _isLoading = false;
  String? _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: LoadingManager(
          isLoading: _isLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 32,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: _size.height / 10,
                ),
                AppTextFormField(
                  label: "Email",
                  initialValue: _email,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => Validator.isEmail(value) ? null : "Invalid email",
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: _size.width / 1.5,
                  child: AppButton(
                    text: "Verify",
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;
                      _formKey.currentState?.save();

                      _isLoading = true;
                      setState(() {});
                      await Future.delayed(Duration(seconds: 2));
                      context.pushNamed(forgetPasswordScreen, params: {'email': _email!});

                      _isLoading = false;
                      setState(() {});
                    },
                  ),
                ),
                //SizedBox(height: _size.height/2.6,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
