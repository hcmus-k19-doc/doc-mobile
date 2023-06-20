export 'color_const.dart';
export 'font_const.dart';
export 'api_const.dart';

class EnumOrCompanionObjectConstHere{
  static const title = "title";
}

class ConstValue {
  static const descriptionTextScale = 1.5;
  static const courseNameTextScale = 1.75;
}

class ImagesPath {
  static const logo = "assets/images/logo.png";
  static const vietnam = "assets/images/vietnam.png";
  static const english = "assets/images/britain.png";
  static const pdfFile = "assets/images/pdf_file.png";
}

class ButtonType {
  static const outlinedButton = "outlinedButton";
  static const filledButton = "filledButton";
  static const filledWhiteButton = "filledWhiteButton";
}

class DisplayMap {
  static const Map<String, String> urgencyLevel = {
    'LOW':'Thấp',
    'MEDIUM':'Trung bình',
    'HIGH':'Cao',
  };

  static const Map<String, String> sendingLevel = {
    'CITY':'Thành phố',
    'DISTRICT':'Quận',
    'SCHOOL':'Trường',
  };

  static const Map<String, String> statusLevel = {
    'IN_PROGRESS': 'Đang xử lý',
    'RELEASED': 'Đã phát hành',
    'UNPROCESSED':'Chưa xử lý',
    'CLOSED':'Đã xử lý',
    'READY_TO_RELEASE':"Sẵn sàng phát hành",
    "WAITING_FOR_OUTGOING_NUMBER":"Chờ số đi"
  };

  static const List<String> outgoingProcess = [
    "Chuyên viên",
    "Trưởng phòng",
    "Giám đốc"
  ];

  static const List<String> incomingProcess = [
    "Giám đốc",
    "Trưởng phòng",
    "Văn thư"
  ];
}
