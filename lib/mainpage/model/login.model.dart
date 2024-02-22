// To parse this JSON data, do
//
//     final loginUpResponse = loginUpResponseFromJson(jsonString);

import 'dart:convert';

LoginUpResponse loginUpResponseFromJson(String str) => LoginUpResponse.fromJson(json.decode(str));

String loginUpResponseToJson(LoginUpResponse data) => json.encode(data.toJson());

class LoginUpResponse {
    String message;
    Data data;
    bool status;

    LoginUpResponse({
        required this.message,
        required this.data,
        required this.status,
    });

    factory LoginUpResponse.fromJson(Map<String, dynamic> json) => LoginUpResponse(
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
    String enloginid;
    String upid;
    bool status;

    Data({
        required this.id,
        required this.enloginid,
        required this.upid,
        required this.status,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: Id.fromJson(json["_id"]),
        enloginid: json["enloginid"],
        upid: json["upid"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "enloginid": enloginid,
        "upid": upid,
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
