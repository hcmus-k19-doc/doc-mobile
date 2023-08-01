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
  bool? isRead;
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
      this.isRead,
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
    isRead = json['isRead'];
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
    data['isRead'] = isRead;
    data['receiverName'] = receiverName;
    return data;
  }

  TransferHistory copyWith({
    int? id,
    List<int>? documentIds,
    String? createdDate,
    String? processingDuration,
    bool? isInfiniteProcessingTime,
    bool? isTransferToSameLevel,
    String? processMethod,
    int? senderId,
    String? senderName,
    int? receiverId,
    bool? isRead,
    String? receiverName,
  }) {
    return TransferHistory(
      id: id ?? this.id,
      documentIds: documentIds ?? this.documentIds,
      createdDate: createdDate ?? this.createdDate,
      processingDuration: processingDuration ?? this.processingDuration,
      isInfiniteProcessingTime:
          isInfiniteProcessingTime ?? this.isInfiniteProcessingTime,
      isTransferToSameLevel:
          isTransferToSameLevel ?? this.isTransferToSameLevel,
      processMethod: processMethod ?? this.processMethod,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      receiverId: receiverId ?? this.receiverId,
      isRead: isRead ?? this.isRead,
      receiverName: receiverName ?? this.receiverName,
    );
  }
}
