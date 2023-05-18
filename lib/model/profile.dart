import 'package:flutter_app/model/department.dart';

class Profile {
  int? id;
  int? version;
  String? createdDate;
  String? createdBy;
  String? username;
  String? email;
  String? fullName;
  String? role;
  Department? department;

  Profile(
      {this.id,
      this.version,
      this.createdDate,
      this.createdBy,
      this.username,
      this.email,
      this.fullName,
      this.role,
      this.department});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    username = json['username'];
    email = json['email'];
    fullName = json['fullName'];
    role = json['role'];
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['username'] = username;
    data['email'] = email;
    data['fullName'] = fullName;
    data['role'] = role;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    return data;
  }
}
