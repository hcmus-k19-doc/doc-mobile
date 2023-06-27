class ProcessingDetail {
  String? incomingNumber;
  String? outgoingNumber;
  int? step;
  ProcessingUser? processingUser;

  ProcessingDetail({this.incomingNumber, this.outgoingNumber, this.step, this.processingUser});

  ProcessingDetail.fromJson(Map<String, dynamic> json) {
    incomingNumber = json['incomingNumber'];
    outgoingNumber = json['outgoingNumber'];
    step = json['step'];
    processingUser = json['processingUser'] != null
        ? ProcessingUser.fromJson(json['processingUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['incomingNumber'] = incomingNumber;
    data['outgoingNumber'] = outgoingNumber;
    data['step'] = step;
    if (processingUser != null) {
      data['processingUser'] = processingUser!.toJson();
    }
    return data;
  }
}

class ProcessingUser {
  int? id;
  String? fullName;
  String? role;
  String? department;
  String? docSystemRole;
  String? roleTitle;

  ProcessingUser({this.id, this.fullName, this.role, this.department});

  ProcessingUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    role = json['role'];
    department = json['department'];
    docSystemRole = json['docSystemRole'];
    roleTitle = json['roleTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['role'] = role;
    data['department'] = department;
    data['docSystemRole'] = docSystemRole;
    data['roleTitle'] = roleTitle;
    return data;
  }
}
