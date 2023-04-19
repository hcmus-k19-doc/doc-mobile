class ReminderDetail {
  int? id;
  int? version;
  String? incomingNumber;
  String? summary;
  String? expirationDate;
  String? status;
  String? processingDocumentId;

  ReminderDetail(
      {this.id,
      this.version,
      this.incomingNumber,
      this.summary,
      this.expirationDate,
      this.status,
      this.processingDocumentId});

  ReminderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    incomingNumber = json['incomingNumber'];
    summary = json['summary'];
    expirationDate = json['expirationDate'];
    status = json['status'];
    processingDocumentId = json['processingDocumentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['incomingNumber'] = incomingNumber;
    data['summary'] = summary;
    data['expirationDate'] = expirationDate;
    data['status'] = status;
    data['processingDocumentId'] = processingDocumentId;
    return data;
  }
}
