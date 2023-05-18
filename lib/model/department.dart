class Department {
  int? id;
  int? version;
  String? createdDate;
  String? createdBy;
  String? departmentName;

  Department(
      {this.id,
      this.version,
      this.createdDate,
      this.createdBy,
      this.departmentName});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    departmentName = json['departmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['departmentName'] = departmentName;
    return data;
  }
}
