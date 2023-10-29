import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/validator_controller.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_icon_button.dart';
import 'package:flutter_app/views/common_widgets/loaders/loading_manager.dart';
import 'package:flutter_app/views/common_widgets/text_field/app_text_form_field.dart';
import 'package:flutter_app/views/common_widgets/titles/app_title.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/profile/profile_info.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

class ProfileView extends StatefulWidget {
  final User user;
  const ProfileView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _editingMode = false;
  bool _isLoading = false;
  User _user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _user.fromUser(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LoadingManager(
        isLoading: _isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(flex: 2, child: AppTitle("Profile")),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: _editingMode
                        ? Row(
                            children: [
                              AppIconButton(
                                iconData: Icons.cancel_outlined,
                                onPressed: () {
                                  _editingMode = false;
                                  _user.fromUser(widget.user);
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                width: 8 * AppResponsive.scaleFactor,
                              ),
                              AppIconButton(
                                iconData: Icons.check_circle_outline,
                                onPressed: () async {
                                  if (!_formKey.currentState!.validate()) return;
                                  _formKey.currentState?.save();
                                  _isLoading = true;
                                  setState(() {});
                                  await Future.delayed(Duration(seconds: 2));
                                  _editingMode = false;
                                  widget.user.fromUser(_user);
                                  _isLoading = false;
                                  setState(() {});
                                },
                              ),
                            ],
                          )
                        : AppIconButton(
                            iconData: Icons.edit,
                            onPressed: () {
                              _editingMode = true;
                              setState(() {});
                            },
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16 * AppResponsive.scaleFactor,
            ),
            ProfileInfo(
                label: "name",
                value: _user.displayName!,
                field: AppTextFormField(
                  label: "Name",
                  initialValue: _user.displayName,
                  validator: (value) => Validator.hasValue(value) ? null : "Required",
                  onSaved: (value) {
                    _user.displayName = value;
                  },
                ),
                editing: _editingMode),
            SizedBox(
              height: 16 * AppResponsive.scaleFactor,
            ),
            ProfileInfo(
                label: "email",
                value: _user.email!,
                field: AppTextFormField(
                  label: "Email",
                  initialValue: _user.email,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => Validator.isEmail(value) ? null : "Invalid Email",
                  onSaved: (value) {
                    _user.email = value;
                  },
                ),
                editing: _editingMode),
            SizedBox(
              height: 16 * AppResponsive.scaleFactor,
            ),
            ProfileInfo(
                label: "phone",
                value: _user.phoneNumber!,
                field: AppTextFormField(
                  label: "Phone",
                  length: 11,
                  initialValue: _user.phoneNumber,
                  textInputType: TextInputType.phone,
                  validator: (value) => Validator.isPhoneNumber(value) ? null : "Invalid Phone",
                  onSaved: (value) {
                    _user.phoneNumber = value;
                  },
                ),
                editing: _editingMode),
          ],
        ),
      ),
    );
  }
}
