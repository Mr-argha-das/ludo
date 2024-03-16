import 'package:dio/dio.dart';
import 'package:ludo/mainpage/model/signup.model.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
part 'api.login.service.g.dart';


@RestApi(baseUrl: "http://139.59.17.168:8888")
abstract class UserLoginSignup{
  factory UserLoginSignup(Dio dio) = _UserLoginSignup;

  @POST('/create-user')
  Future<SignUpResponse> signupp(@Body() UserCreateModel body);
  @POST('/add-user-balance')
  Future<AddBalanceResponseModel> addBalance(@Body() AddBalanceModel body );


}

// To parse this JSON data, do
//
//     final userCreateModel = userCreateModelFromJson(jsonString);


AddBalanceModel addBalanceModelFromJson(String str) => AddBalanceModel.fromJson(json.decode(str));

String addBalanceModelToJson(AddBalanceModel data) => json.encode(data.toJson());

class AddBalanceModel {
    String userId;
    String balance;

    AddBalanceModel({
        required this.userId,
        required this.balance,
    });

    factory AddBalanceModel.fromJson(Map<String, dynamic> json) => AddBalanceModel(
        userId: json["user_id"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "balance": balance,
    };
}


AddBalanceResponseModel addBalanceResponseModelFromJson(String str) => AddBalanceResponseModel.fromJson(json.decode(str));

String addBalanceResponseModelToJson(AddBalanceResponseModel data) => json.encode(data.toJson());

class AddBalanceResponseModel {
    String message;
    bool status;

    AddBalanceResponseModel({
        required this.message,
        required this.status,
    });

    factory AddBalanceResponseModel.fromJson(Map<String, dynamic> json) => AddBalanceResponseModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}


UserCreateModel userCreateModelFromJson(String str) => UserCreateModel.fromJson(json.decode(str));

String userCreateModelToJson(UserCreateModel data) => json.encode(data.toJson());

class UserCreateModel {
    String enloginid;
    String upid;

    UserCreateModel({
        required this.enloginid,
        required this.upid,
    });

    factory UserCreateModel.fromJson(Map<String, dynamic> json) => UserCreateModel(
        enloginid: json["enloginid"],
        upid: json["upid"],
    );

    Map<String, dynamic> toJson() => {
        "enloginid": enloginid,
        "upid": upid,
    };
}
