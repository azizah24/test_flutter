class LoginModel{
  String? token, message, returnvalue, uuid;

  LoginModel({this.message, this.token, this.returnvalue, this.uuid,
 });

  factory LoginModel.fromJson(Map<String, dynamic> json) {

    return LoginModel(
      message: json["message"],
      token: json["token"],
      returnvalue: json["returnValue"],

    );
  }

}