class TransferHistory {
  int? id;
  List<int>? documentIds;
  String? createdDate;
  String? processingDuration;
  bool? isInfiniteProcessingTime;
  bool? isTransferToSameLevel;
  String? processMethod;
  int? senderId;
  String? senderName;
  int? receiverId;
  String? receiverName;

  TransferHistory(
      {this.id,
      this.documentIds,
      this.createdDate,
      this.processingDuration,
      this.isInfiniteProcessingTime,
      this.isTransferToSameLevel,
      this.processMethod,
      this.senderId,
      this.senderName,
      this.receiverId,
      this.receiverName});

  TransferHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentIds = json['documentIds'].cast<int>();
    createdDate = json['createdDate'];
    processingDuration = json['processingDuration'];
    isInfiniteProcessingTime = json['isInfiniteProcessingTime'];
    isTransferToSameLevel = json['isTransferToSameLevel'];
    processMethod = json['processMethod'];
    senderId = json['senderId'];
    senderName = json['senderName'];
    receiverId = json['receiverId'];
    receiverName = json['receiverName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['documentIds'] = documentIds;
    data['createdDate'] = createdDate;
    data['processingDuration'] = processingDuration;
    data['isInfiniteProcessingTime'] = isInfiniteProcessingTime;
    data['isTransferToSameLevel'] = isTransferToSameLevel;
    data['processMethod'] = processMethod;
    data['senderId'] = senderId;
    data['senderName'] = senderName;
    data['receiverId'] = receiverId;
    data['receiverName'] = receiverName;
    return data;
  }
}
