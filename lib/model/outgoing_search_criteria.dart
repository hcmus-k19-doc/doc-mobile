class OutgoingSearchCriteria {
  String? outgoingNumber;
  String? originalSymbolNumber;
  int? documentTypeId;
  String? releaseDateFrom;
  String? releaseDateTo;
  String? summary;

//<editor-fold desc="Data Methods">
  OutgoingSearchCriteria({
    this.outgoingNumber,
    this.originalSymbolNumber,
    this.documentTypeId,
    this.releaseDateFrom,
    this.releaseDateTo,
    this.summary,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutgoingSearchCriteria &&
          runtimeType == other.runtimeType &&
          outgoingNumber == other.outgoingNumber &&
          originalSymbolNumber == other.originalSymbolNumber &&
          documentTypeId == other.documentTypeId &&
          releaseDateFrom == other.releaseDateFrom &&
          releaseDateTo == other.releaseDateTo &&
          summary == other.summary);

  @override
  int get hashCode =>
      outgoingNumber.hashCode ^
      originalSymbolNumber.hashCode ^
      documentTypeId.hashCode ^
      releaseDateFrom.hashCode ^
      releaseDateTo.hashCode ^
      summary.hashCode;

  @override
  String toString() {
    return 'OutgoingSearchCriteria{' +
        ' outgoingNumber: $outgoingNumber,' +
        ' originalSymbolNumber: $originalSymbolNumber,' +
        ' documentTypeId: $documentTypeId,' +
        ' releaseDateFrom: $releaseDateFrom,' +
        ' releaseDateTo: $releaseDateTo,' +
        ' summary: $summary,' +
        '}';
  }

  OutgoingSearchCriteria copyWith({
    String? outgoingNumber,
    String? originalSymbolNumber,
    int? documentTypeId,
    String? releaseDateFrom,
    String? releaseDateTo,
    String? summary,
  }) {
    return OutgoingSearchCriteria(
      outgoingNumber: outgoingNumber ?? this.outgoingNumber,
      originalSymbolNumber: originalSymbolNumber ?? this.originalSymbolNumber,
      documentTypeId: documentTypeId ?? this.documentTypeId,
      releaseDateFrom: releaseDateFrom ?? this.releaseDateFrom,
      releaseDateTo: releaseDateTo ?? this.releaseDateTo,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'outgoingNumber': this.outgoingNumber,
      'originalSymbolNumber': this.originalSymbolNumber,
      'documentTypeId': this.documentTypeId,
      'releaseDateFrom': this.releaseDateFrom,
      'releaseDateTo': this.releaseDateTo,
      'summary': this.summary,
    };
  }

  factory OutgoingSearchCriteria.fromMap(Map<String, dynamic> map) {
    return OutgoingSearchCriteria(
      outgoingNumber: map['outgoingNumber'] as String,
      originalSymbolNumber: map['originalSymbolNumber'] as String,
      documentTypeId: map['documentTypeId'] as int,
      releaseDateFrom: map['releaseDateFrom'] as String,
      releaseDateTo: map['releaseDateTo'] as String,
      summary: map['summary'] as String,
    );
  }

//</editor-fold>
}
