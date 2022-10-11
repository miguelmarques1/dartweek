class RegisterUserModel {
  final String email;
  final String name;
  final String password;
  final String confirmPassword;

  RegisterUserModel({required this.email, required this.name, required this.password, required this.confirmPassword});


  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(email: map["email"] ?? '', name: map["name"] ?? "", password: map["password"] ?? "", confirmPassword: map["confirmPassword"] ?? "");
  }

}