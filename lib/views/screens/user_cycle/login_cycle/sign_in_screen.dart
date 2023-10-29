import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/validator_controller.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_text_button.dart';
import 'package:flutter_app/views/common_widgets/loaders/loading_manager.dart';
import 'package:flutter_app/views/common_widgets/text_field/app_text_form_field.dart';
import 'package:flutter_app/views/router/router.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/profile/user_profile_screen.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/sign_up_screen.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/verify_email_screen.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  static final String id = "/sign-in";
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late Size _size;
  bool _hidePassword = true;
  bool _isLoading = false;
  User _user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: LoadingManager(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
          child: Column(
            children: [
              SizedBox(
                height: _size.height / 10,
              ),
              AppTextFormField(
                label: "Email",
                initialValue: _user.email,
                textInputType: TextInputType.emailAddress,
                validator: (value) => Validator.isEmail(value) ? null : "Invalid email",
                onSaved: (value) {
                  _user.email = value;
                },
              ),
              SizedBox(
                height: 16,
              ),
              AppTextFormField(
                label: "password",
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
                validator: (value) =>
                    Validator.isValidPassword(value) ? null : "Password too short",
                onSaved: (value) {
                  _user.password = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTextButton(
                    text: "Forget Password?",
                    onPressed: () {
                      context.pushNamed(verifyEmailScreen);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: _size.width / 1.5,
                child: AppButton(
                  text: "Sign In",
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    _formKey.currentState?.save();

                    _isLoading = true;
                    setState(() {});
                    await Future.delayed(Duration(seconds: 1));
                    context.pushNamed(userProfileScreen);

                    _isLoading = false;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?"),
                  AppTextButton(
                    text: "Sign Up!",
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      context.pushNamed(signupScreen);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
