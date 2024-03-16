import 'package:ludo/mainpage/model/login.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
part 'login.api.service.g.dart';

@RestApi(baseUrl: "http://139.59.17.168:8888")
abstract class UserLogin{
  factory UserLogin(Dio dio) = _UserLogin;
  @POST('/user-login')
  Future<LoginUpResponse> login(@Body() UserLoginModel body);
}



UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
    String enloginid;

    UserLoginModel({
        required this.enloginid,
    });

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        enloginid: json["enloginid"],
    );

    Map<String, dynamic> toJson() => {
        "enloginid": enloginid,
    };
}
