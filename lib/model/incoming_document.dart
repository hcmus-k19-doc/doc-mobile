import 'package:flutter_app/model/distrbution_org.dart';
import 'package:flutter_app/model/document_type.dart';

class IncomingDocument {
  int? id;
  String? version;
  String? status;
  String? processingDuration;
  String? incomingNumber;
  DocumentType? documentType;
  String? originalSymbolNumber;
  DistributionOrg? distributionOrg;
  String? arrivingDate;
  String? summary;
  SendingLevel? sendingLevel;
  String? folder;
  List<String>? attachments;

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
      this.sendingLevel,
      this.folder,
      this.attachments});

  IncomingDocument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    status = json['status'];
    processingDuration = json['processingDuration'];
    incomingNumber = json['incomingNumber'];
    documentType = json['documentType'] != null
        ? DocumentType.fromJson(json['documentType'])
        : null;
    originalSymbolNumber = json['originalSymbolNumber'];
    distributionOrg = json['distributionOrg'] != null
        ? DistributionOrg.fromJson(json['distributionOrg'])
        : null;
    arrivingDate = json['arrivingDate'];
    summary = json['summary'];
    sendingLevel = json['sendingLevel'] != null
        ? SendingLevel.fromJson(json['sendingLevel'])
        : null;
    folder = json['folder'];
    attachments = json['attachments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['status'] = status;
    data['processingDuration'] = processingDuration;
    data['incomingNumber'] = incomingNumber;
    if (documentType != null) {
      data['documentType'] = documentType!.toJson();
    }
    data['originalSymbolNumber'] = originalSymbolNumber;
    if (distributionOrg != null) {
      data['distributionOrg'] = distributionOrg!.toJson();
    }
    data['arrivingDate'] = arrivingDate;
    data['summary'] = summary;
    if (sendingLevel != null) {
      data['sendingLevel'] = sendingLevel!.toJson();
    }
    data['folder'] = folder;
    data['attachments'] = attachments;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['level'] = level;
    return data;
  }
}
