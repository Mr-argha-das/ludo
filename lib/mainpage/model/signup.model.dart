// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
    String message;
    Data data;
    bool status;

    SignUpResponse({
        required this.message,
        required this.data,
        required this.status,
    });

    factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
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
