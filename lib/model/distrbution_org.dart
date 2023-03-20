class DistributionOrg {
  int? id;
  Null? version;
  String? name;

  DistributionOrg({this.id, this.version, this.name});

  DistributionOrg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['version'] = this.version;
    data['name'] = this.name;
    return data;
  }
}
