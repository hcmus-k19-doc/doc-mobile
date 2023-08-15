class CustomOutgoingDoc {
  int? id;
  int? version;
  String? createdDate;
  String? createdBy;
  String? ordinalNumber;
  String? name;
  String? outgoingNumber;
  String? originalSymbolNumber;
  String? documentTypeName;
  String? publishingDepartmentName;
  String? status;
  bool? isDocTransferred;
  bool? isDocCollaborator;
  bool? isTransferable;
  String? customProcessingDuration;
  String? summary;

  CustomOutgoingDoc(
      {this.id,
      this.version,
      this.createdDate,
      this.createdBy,
      this.ordinalNumber,
      this.name,
      this.outgoingNumber,
      this.originalSymbolNumber,
      this.documentTypeName,
      this.publishingDepartmentName,
      this.status,
      this.isDocTransferred,
      this.isDocCollaborator,
      this.isTransferable,
      this.customProcessingDuration,
      this.summary});

  CustomOutgoingDoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    ordinalNumber = json['ordinalNumber'];
    name = json['name'];
    outgoingNumber = json['outgoingNumber'];
    originalSymbolNumber = json['originalSymbolNumber'];
    documentTypeName = json['documentTypeName'];
    publishingDepartmentName = json['publishingDepartmentName'];
    status = json['status'];
    isDocTransferred = json['isDocTransferred'];
    isDocCollaborator = json['isDocCollaborator'];
    isTransferable = json['isTransferable'];
    customProcessingDuration = json['customProcessingDuration'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['ordinalNumber'] = ordinalNumber;
    data['name'] = name;
    data['outgoingNumber'] = outgoingNumber;
    data['originalSymbolNumber'] = originalSymbolNumber;
    data['documentTypeName'] = documentTypeName;
    data['publishingDepartmentName'] = publishingDepartmentName;
    data['status'] = status;
    data['isDocTransferred'] = isDocTransferred;
    data['isDocCollaborator'] = isDocCollaborator;
    data['isTransferable'] = isTransferable;
    data['customProcessingDuration'] = customProcessingDuration;
    data['summary'] = summary;
    return data;
  }
}
