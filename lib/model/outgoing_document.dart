import 'document_type.dart';
import 'incoming_document.dart';

class OutgoingDocument {
  int? id;
  int? version;
  String? createdDate;
  String? createdBy;
  String? outgoingNumber;
  String? originalSymbolNumber;
  String? recipient;
  String? signer;
  String? summary;
  String? urgency;
  String? confidentiality;
  DocumentType? documentType;
  Folder? folder;
  String? releaseDate;
  PublishingDepartment? publishingDepartment;
  String? status;

  OutgoingDocument(
      {this.id,
        this.version,
        this.createdDate,
        this.createdBy,
        this.outgoingNumber,
        this.originalSymbolNumber,
        this.recipient,
        this.signer,
        this.summary,
        this.urgency,
        this.confidentiality,
        this.documentType,
        this.folder,
        this.releaseDate,
        this.publishingDepartment,
        this.status});

  OutgoingDocument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    outgoingNumber = json['outgoingNumber'];
    originalSymbolNumber = json['originalSymbolNumber'];
    recipient = json['recipient'];
    signer = json['signer'];
    summary = json['summary'];
    urgency = json['urgency'];
    confidentiality = json['confidentiality'];
    documentType = json['documentType'] != null
        ? DocumentType.fromJson(json['documentType'])
        : null;
    folder =
    json['folder'] != null ? Folder.fromJson(json['folder']) : null;
    releaseDate = json['releaseDate'];
    publishingDepartment = json['publishingDepartment'] != null
        ? PublishingDepartment.fromJson(json['publishingDepartment'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['outgoingNumber'] = outgoingNumber;
    data['originalSymbolNumber'] = originalSymbolNumber;
    data['recipient'] = recipient;
    data['signer'] = signer;
    data['summary'] = summary;
    data['urgency'] = urgency;
    data['confidentiality'] = confidentiality;
    if (documentType != null) {
      data['documentType'] = documentType!.toJson();
    }
    if (folder != null) {
      data['folder'] = folder!.toJson();
    }
    data['releaseDate'] = releaseDate;
    if (publishingDepartment != null) {
      data['publishingDepartment'] = publishingDepartment!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class PublishingDepartment {
  int? id;
  int? version;
  String? createdDate;
  String? createdBy;
  String? departmentName;
  ManagerInfo? truongPhong;
  String? description;

  PublishingDepartment(
      {this.id,
        this.version,
        this.createdDate,
        this.createdBy,
        this.departmentName,
        this.truongPhong,
        this.description});

  PublishingDepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    departmentName = json['departmentName'];
    truongPhong = json['truongPhong'] != null
        ? ManagerInfo.fromJson(json['truongPhong'])
        : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['version'] = version;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['departmentName'] = departmentName;
    if (truongPhong != null) {
      data['truongPhong'] = truongPhong!.toJson();
    }
    data['description'] = description;
    return data;
  }
}

class ManagerInfo {
  int? id;
  String? fullName;

  ManagerInfo({this.id, this.fullName});

  ManagerInfo.fromJson(Map<String, dynamic> json) {
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
