class TruongPhong {
  int? id;
  String? fullName;

  TruongPhong({this.id, this.fullName});

  TruongPhong.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    return data;
  }
}
