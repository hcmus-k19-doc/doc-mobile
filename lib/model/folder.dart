class Folder {
  int? id;
  int? version;
  String? folderName;
  int? nextNumber;
  int? year;

  Folder({this.id, this.version, this.folderName, this.nextNumber, this.year});

  Folder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    folderName = json['folderName'];
    nextNumber = json['nextNumber'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['folderName'] = folderName;
    data['nextNumber'] = nextNumber;
    data['year'] = year;
    return data;
  }
}
