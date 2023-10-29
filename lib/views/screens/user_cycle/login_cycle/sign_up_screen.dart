import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/validator_controller.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_text_button.dart';
import 'package:flutter_app/views/common_widgets/loaders/loading_manager.dart';
import 'package:flutter_app/views/common_widgets/text_field/app_text_form_field.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  static final String id = "/sign-up";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Size _size;
  bool _hidePassword = true;
  bool _isLoading = false;
  User _user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: LoadingManager(
            isLoading: _isLoading,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    AppTextFormField(
                      label: "Name",
                      initialValue: _user.displayName,
                      validator: (value) => Validator.hasValue(value) ? null : "Required",
                      onSaved: (value) {
                        _user.displayName = value;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AppTextFormField(
                      label: "Email",
                      initialValue: _user.email,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) => Validator.isEmail(value) ? null : "Invalid Email",
                      onSaved: (value) {
                        _user.email = value;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AppTextFormField(
                      label: "Password",
                      initialValue: _user.password,
                      obscureText: _hidePassword,
                      suffixIcon: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 26,
                        child: Icon(
                          _hidePassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                        ),
                        onPressed: () {
                          _hidePassword = !_hidePassword;
                          setState(() {});
                        },
                      ),
                      validator: (value) => Validator.isValidPassword(value)
                          ? null
                          : "Password at least 6 characters or numbers",
                      onChange: (value) {
                        _user.password = value;
                      },
                      onSaved: (value) {
                        _user.password = value;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AppTextFormField(
                      label: "Confirm Password",
                      initialValue: _user.password,
                      obscureText: _hidePassword,
                      suffixIcon: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 26,
                        child: Icon(
                          _hidePassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                          //color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          _hidePassword = !_hidePassword;
                          setState(() {});
                        },
                      ),
                      validator: (value) => value == _user.password
                          ? null
                          : "Confirm password and password not match",
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: _size.width / 1.5,
                      child: AppButton(
                        text: "Sign Up",
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          _formKey.currentState?.save();
                          _isLoading = true;
                          setState(() {});
                          await Future.delayed(Duration(seconds: 2));
                          _isLoading = false;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: _size.height / 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do You Have Account!"),
                        AppTextButton(
                          text: "Sign In?",
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            context.pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
