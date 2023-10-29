class ForgetPasswordModel {
  String? code;
  String? password;
  String? email;

  ForgetPasswordModel({
    this.email,
    this.password,
    this.code,
  });

  Map<String, dynamic> toMap() {
    Map<String, String> map = {};
    if (code != null) map["code"] = code!;
    if (email != null) map["email"] = email!;
    if (password != null) map["password"] = password!;
    return map;
  }
}
