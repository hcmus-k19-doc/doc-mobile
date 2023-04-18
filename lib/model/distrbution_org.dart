class DistributionOrg {
  int? id;
  int? version;
  String? name;
  String? symbol;

  DistributionOrg({this.id, this.version, this.name, this.symbol});

  DistributionOrg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}
