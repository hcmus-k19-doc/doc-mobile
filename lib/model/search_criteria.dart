class SearchCriteria {
  String? incomingNumber;
  String? originalSymbolNumber;
  String? documentType;
  String? distributionOrg;
  String? arrivingDateFrom;
  String? arrivingDateTo;
  String? processingDurationFrom;
  String? processingDurationTo;
  String? summary;

//<editor-fold desc="Data Methods">
  SearchCriteria({
    this.incomingNumber,
    this.originalSymbolNumber,
    this.documentType,
    this.distributionOrg,
    this.arrivingDateFrom,
    this.arrivingDateTo,
    this.processingDurationFrom,
    this.processingDurationTo,
    this.summary,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchCriteria &&
          runtimeType == other.runtimeType &&
          incomingNumber == other.incomingNumber &&
          originalSymbolNumber == other.originalSymbolNumber &&
          documentType == other.documentType &&
          distributionOrg == other.distributionOrg &&
          arrivingDateFrom == other.arrivingDateFrom &&
          arrivingDateTo == other.arrivingDateTo &&
          processingDurationFrom == other.processingDurationFrom &&
          processingDurationTo == other.processingDurationTo &&
          summary == other.summary);

  @override
  int get hashCode =>
      incomingNumber.hashCode ^
      originalSymbolNumber.hashCode ^
      documentType.hashCode ^
      distributionOrg.hashCode ^
      arrivingDateFrom.hashCode ^
      arrivingDateTo.hashCode ^
      processingDurationFrom.hashCode ^
      processingDurationTo.hashCode ^
      summary.hashCode;

  @override
  String toString() {
    return 'SearchCriteria{' +
        ' incomingNumber: $incomingNumber,' +
        ' originalSymbolNumber: $originalSymbolNumber,' +
        ' documentType: $documentType,' +
        ' distributionOrg: $distributionOrg,' +
        ' arrivingDateFrom: $arrivingDateFrom,' +
        ' arrivingDateTo: $arrivingDateTo,' +
        ' processingDurationFrom: $processingDurationFrom,' +
        ' processingDurationTo: $processingDurationTo,' +
        ' summary: $summary,' +
        '}';
  }

  SearchCriteria copyWith({
    String? incomingNumber,
    String? originalSymbolNumber,
    String? documentType,
    String? distributionOrg,
    String? arrivingDateFrom,
    String? arrivingDateTo,
    String? processingDurationFrom,
    String? processingDurationTo,
    String? summary,
  }) {
    return SearchCriteria(
      incomingNumber: incomingNumber ?? this.incomingNumber,
      originalSymbolNumber: originalSymbolNumber ?? this.originalSymbolNumber,
      documentType: documentType ?? this.documentType,
      distributionOrg: distributionOrg ?? this.distributionOrg,
      arrivingDateFrom: arrivingDateFrom ?? this.arrivingDateFrom,
      arrivingDateTo: arrivingDateTo ?? this.arrivingDateTo,
      processingDurationFrom:
          processingDurationFrom ?? this.processingDurationFrom,
      processingDurationTo: processingDurationTo ?? this.processingDurationTo,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'incomingNumber': this.incomingNumber,
      'originalSymbolNumber': this.originalSymbolNumber,
      'documentType': this.documentType,
      'distributionOrg': this.distributionOrg,
      'arrivingDateFrom': this.arrivingDateFrom,
      'arrivingDateTo': this.arrivingDateTo,
      'processingDurationFrom': this.processingDurationFrom,
      'processingDurationTo': this.processingDurationTo,
      'summary': this.summary,
    };
  }

  factory SearchCriteria.fromMap(Map<String, dynamic> map) {
    return SearchCriteria(
      incomingNumber: map['incomingNumber'] as String,
      originalSymbolNumber: map['originalSymbolNumber'] as String,
      documentType: map['documentType'] as String,
      distributionOrg: map['distributionOrg'] as String,
      arrivingDateFrom: map['arrivingDateFrom'] as String,
      arrivingDateTo: map['arrivingDateTo'] as String,
      processingDurationFrom: map['processingDurationFrom'] as String,
      processingDurationTo: map['processingDurationTo'] as String,
      summary: map['summary'] as String,
    );
  }

//</editor-fold>
}
