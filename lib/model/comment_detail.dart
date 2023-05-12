class Comment {
  int? id;
  int? version;
  String? createdDate;
  String? createdBy;
  String? content;

  Comment(
      {this.id, this.version, this.createdDate, this.createdBy, this.content});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['content'] = content;
    return data;
  }
}