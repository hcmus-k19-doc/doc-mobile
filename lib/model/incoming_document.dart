import 'package:flutter_app/model/distrbution_org.dart';
import 'package:flutter_app/model/document_type.dart';
import 'package:flutter_app/model/folder.dart';

class IncomingDocument {
  int? id;
  num? version;
  String? status;
  String? processingDuration;
  String? incomingNumber;
  DocumentType? documentType;
  String? originalSymbolNumber;
  DistributionOrg? distributionOrg;
  String? arrivingDate;
  String? summary;
  SendingLevel? sendingLevel;
  Folder? folder;
  List<Attachment>? attachments;
  String? distributionDate;
  String? arrivingTime;
  String? urgency;
  String? confidentiality;

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
      this.attachments,
      this.distributionDate,
      this.arrivingTime,
      this.urgency,
      this.confidentiality});

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
    folder = json['folder'] != null ? Folder.fromJson(json['folder']) : null;
    attachments = json["attachments"] != null
        ? List<Attachment>.from(json['attachments'].map((attachment)=>Attachment.fromJson(attachment)))
        : null;
    distributionDate = json['distributionDate'];
    arrivingTime = json['arrivingTime'];
    urgency = json['urgency'];
    confidentiality = json['confidentiality'];
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
    if (folder != null) {
      data['folder'] = folder!.toJson();
    }
    data['attachments'] = attachments;
    data['distributionDate'] = distributionDate;
    data['arrivingTime'] = arrivingTime;
    data['urgency'] = urgency;
    data['confidentiality'] = confidentiality;
    return data;
  }
}

class SendingLevel {
  int? id;
  num? version;
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

class Attachment {
  int? id;
  num? version;
  String? createdDate;
  String? createdBy;
  int? docId;
  String? alfrescoFileId;
  String? alfrescoFolderId;
  String? fileType;

  Attachment(
      {this.id,
        this.version,
        this.createdDate,
        this.createdBy,
        this.docId,
        this.alfrescoFileId,
        this.alfrescoFolderId,
        this.fileType});

  Attachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    docId = json['docId'];
    alfrescoFileId = json['alfrescoFileId'];
    alfrescoFolderId = json['alfrescoFolderId'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['docId'] = docId;
    data['alfrescoFileId'] = alfrescoFileId;
    data['alfrescoFolderId'] = alfrescoFolderId;
    data['fileType'] = fileType;
    return data;
  }
}
