class DocumentType {
  int? id;
  int? version;
  String? type;

  DocumentType({this.id, this.version, this.type});

  DocumentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['version'] = this.version;
    data['type'] = this.type;
    return data;
  }
}
