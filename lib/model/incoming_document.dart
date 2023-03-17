class IncomingDocument {
  int? id;
  Null? version;
  String? status;
  Null? processingDuration;
  String? incomingNumber;
  DocumentType? documentType;
  String? originalSymbolNumber;
  DistributionOrg? distributionOrg;
  String? arrivingDate;
  String? summary;
  SendingLevel? sendingLevel;

  IncomingDocument(
      {this.id,
      this.version,
      this.status,
      this.processingDuration,
      this.incomingNumber,
      this.documentType,
      this.originalSymbolNumber,
      this.distributionOrg,
      this.arrivingDate,
      this.summary,
      this.sendingLevel});

  IncomingDocument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    status = json['status'];
    processingDuration = json['processingDuration'];
    incomingNumber = json['incomingNumber'];
    documentType = json['documentType'] != null
        ? new DocumentType.fromJson(json['documentType'])
        : null;
    originalSymbolNumber = json['originalSymbolNumber'];
    distributionOrg = json['distributionOrg'] != null
        ? new DistributionOrg.fromJson(json['distributionOrg'])
        : null;
    arrivingDate = json['arrivingDate'];
    summary = json['summary'];
    sendingLevel = json['sendingLevel'] != null
        ? new SendingLevel.fromJson(json['sendingLevel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['version'] = this.version;
    data['status'] = this.status;
    data['processingDuration'] = this.processingDuration;
    data['incomingNumber'] = this.incomingNumber;
    if (this.documentType != null) {
      data['documentType'] = this.documentType!.toJson();
    }
    data['originalSymbolNumber'] = this.originalSymbolNumber;
    if (this.distributionOrg != null) {
      data['distributionOrg'] = this.distributionOrg!.toJson();
    }
    data['arrivingDate'] = this.arrivingDate;
    data['summary'] = this.summary;
    if (this.sendingLevel != null) {
      data['sendingLevel'] = this.sendingLevel!.toJson();
    }
    return data;
  }
}

class DocumentType {
  int? id;
  Null? version;
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

class SendingLevel {
  int? id;
  Null? version;
  String? level;

  SendingLevel({this.id, this.version, this.level});

  SendingLevel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['version'] = this.version;
    data['level'] = this.level;
    return data;
  }
}
