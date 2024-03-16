
import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'home.service.g.dart';
@RestApi(baseUrl: "http://139.59.17.168:8888")
abstract class HomeServiece{
 factory HomeServiece(Dio dio) = _HomeServiece;

 @GET('/user-balance/{userid}')
 Future<HomeBalanceModel> getBalance(@Path('userid') String userid);

}


HomeBalanceModel homeBalanceModelFromJson(String str) => HomeBalanceModel.fromJson(json.decode(str));

String homeBalanceModelToJson(HomeBalanceModel data) => json.encode(data.toJson());

class HomeBalanceModel {
    String message;
    Data data;
    bool status;

    HomeBalanceModel({
        required this.message,
        required this.data,
        required this.status,
    });

    factory HomeBalanceModel.fromJson(Map<String, dynamic> json) => HomeBalanceModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "status": status,
    };
}

class Data {
    Id id;
    String userId;
    double balance;
    bool status;

    Data({
        required this.id,
        required this.userId,
        required this.balance,
        required this.status,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: Id.fromJson(json["_id"]),
        userId: json["user_id"],
        balance: double.parse(json["balance"].toString()),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "user_id": userId,
        "balance": balance,
        "status": status,
    };
}

class Id {
    String oid;

    Id({
        required this.oid,
    });

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
    };
}
