class ReminderDetail {
  int? id;
  int? version;
  String? createdDate;
  String? createdBy;
  String? documentName;
  String? documentNumber;
  int? documentId;
  String? summary;
  String? expirationDate;
  String? documentType;

  ReminderDetail(
      {this.id,
      this.version,
      this.createdDate,
      this.createdBy,
      this.documentName,
      this.documentNumber,
      this.documentId,
      this.summary,
      this.expirationDate,
      this.documentType});

  ReminderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    documentName = json['documentName'];
    documentNumber = json['documentNumber'];
    documentId = json['documentId'];
    summary = json['summary'];
    expirationDate = json['expirationDate'];
    documentType = json['documentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['documentName'] = documentName;
    data['documentNumber'] = documentNumber;
    data['documentId'] = documentId;
    data['summary'] = summary;
    data['expirationDate'] = expirationDate;
    data['documentType'] = documentType;
    return data;
  }
}
