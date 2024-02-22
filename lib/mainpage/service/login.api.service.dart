import 'package:ludo/mainpage/model/login.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'login.api.service.g.dart';

@RestApi(baseUrl: "http://127.0.0.1:8000")
abstract class UserLogin{
  factory UserLogin(Dio dio) = _UserLogin;
  @POST('/user-login')
  Future<LoginUpResponse> login(@Field() String enloginid);
}