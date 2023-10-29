import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/validator_controller.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_text_button.dart';
import 'package:flutter_app/views/common_widgets/loaders/loading_manager.dart';
import 'package:flutter_app/views/common_widgets/text_field/app_text_form_field.dart';
import 'package:flutter_app/views/styles/styles.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static final String id = "/forget-password";
  final String email;
  const ForgetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late Size _size;
  bool _hidePassword = true;
  bool _isLoading = false;
  ForgetPasswordModel _model = ForgetPasswordModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _model.email = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = AppResponsive.size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: LoadingManager(
            isLoading: _isLoading,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    AppTextFormField(
                      label: "Code",
                      initialValue: _model.code,
                      validator: (value) => Validator.isValidPassword(value) ? null : "Required",
                      onSaved: (value) {
                        _model.code = value;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AppTextFormField(
                      label: "New Password",
                      initialValue: _model.password,
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
                        _model.password = value;
                      },
                      onSaved: (value) {
                        _model.password = value;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AppTextFormField(
                      label: "Confirm Password",
                      initialValue: _model.password,
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
                      validator: (value) => value == _model.password
                          ? null
                          : "Confirm password and password not match",
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: _size.width / 1.5,
                      child: AppButton(
                        text: "Reset Password",
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
                        Text("Didn't receive message?"),
                        AppTextButton(
                          text: "Resend!",
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () async {
                            _isLoading = true;
                            setState(() {});
                            await Future.delayed(Duration(seconds: 2));
                            _isLoading = false;
                            setState(() {});
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
