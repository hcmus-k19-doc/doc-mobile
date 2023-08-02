class ReturnRequest {
  int? id;
  int? currentProcessingUserId;
  String? currentProcessingUserFullName;
  String? currentProcessingUserRole;
  String? currentProcessingUserRoleTitle;
  int? previousProcessingUserId;
  String? previousProcessingUserFullName;
  String? previousProcessingUserRole;
  String? previousProcessingUserRoleTitle;
  String? createdAt;
  int? documentId;
  String? documentType;
  String? reason;
  String? returnRequestType;

  ReturnRequest(
      {this.id,
      this.currentProcessingUserId,
      this.currentProcessingUserFullName,
      this.currentProcessingUserRole,
      this.currentProcessingUserRoleTitle,
      this.previousProcessingUserId,
      this.previousProcessingUserFullName,
      this.previousProcessingUserRole,
      this.previousProcessingUserRoleTitle,
      this.createdAt,
      this.documentId,
      this.documentType,
      this.reason,
      this.returnRequestType});

  ReturnRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currentProcessingUserId = json['currentProcessingUserId'];
    currentProcessingUserFullName = json['currentProcessingUserFullName'];
    currentProcessingUserRole = json['currentProcessingUserRole'];
    currentProcessingUserRoleTitle = json['currentProcessingUserRoleTitle'];
    previousProcessingUserId = json['previousProcessingUserId'];
    previousProcessingUserFullName = json['previousProcessingUserFullName'];
    previousProcessingUserRole = json['previousProcessingUserRole'];
    previousProcessingUserRoleTitle = json['previousProcessingUserRoleTitle'];
    createdAt = json['createdAt'];
    documentId = json['documentId'];
    documentType = json['documentType'];
    reason = json['reason'];
    returnRequestType = json['returnRequestType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currentProcessingUserId'] = currentProcessingUserId;
    data['currentProcessingUserFullName'] = currentProcessingUserFullName;
    data['currentProcessingUserRole'] = currentProcessingUserRole;
    data['currentProcessingUserRoleTitle'] = currentProcessingUserRoleTitle;
    data['previousProcessingUserId'] = previousProcessingUserId;
    data['previousProcessingUserFullName'] = previousProcessingUserFullName;
    data['previousProcessingUserRole'] = previousProcessingUserRole;
    data['previousProcessingUserRoleTitle'] = previousProcessingUserRoleTitle;
    data['createdAt'] = createdAt;
    data['documentId'] = documentId;
    data['documentType'] = documentType;
    data['reason'] = reason;
    data['returnRequestType'] = returnRequestType;
    return data;
  }
}
