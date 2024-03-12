import 'package:dio/dio.dart';
import 'package:ludo/mainpage/model/signup.model.dart';
import 'package:retrofit/retrofit.dart';

part 'api.login.service.g.dart';


@RestApi(baseUrl: "http://127.0.0.1:8000")
abstract class UserLoginSignup{
  factory UserLoginSignup(Dio dio) = _UserLoginSignup;

  @POST('/create-user')
  Future<SignUpResponse> signupp(@Field() String enloginid, @Field() String upid);

}

