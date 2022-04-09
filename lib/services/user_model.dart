import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.LabTiming,
    this.HomecollectionCharge,
  });
  String? HomecollectionCharge;
  String? LabTiming;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    LabTiming: json["LabTiming"],
    HomecollectionCharge: json["HomecollectionCharge"],
  );

  Map<String, dynamic> toJson() => {
    "LabTiming": LabTiming,
    "city": HomecollectionCharge
  };
}