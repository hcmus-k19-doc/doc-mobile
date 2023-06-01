import 'package:flutter_app/model/truong_phong.dart';

class PublishingDepartment {
  int? id;
  int? version;
  String? createdDate;
  String? createdBy;
  String? departmentName;
  TruongPhong? truongPhong;
  String? description;

  PublishingDepartment(
      {this.id,
      this.version,
      this.createdDate,
      this.createdBy,
      this.departmentName,
      this.truongPhong,
      this.description});

  PublishingDepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    departmentName = json['departmentName'];
    truongPhong = json['truongPhong'] != null
        ? TruongPhong.fromJson(json['truongPhong'])
        : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['departmentName'] = departmentName;
    if (truongPhong != null) {
      data['truongPhong'] = truongPhong!.toJson();
    }
    data['description'] = description;
    return data;
  }
}
