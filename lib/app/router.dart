import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/constants/api_const.dart';
import 'package:flutter_app/repositories/document_reminder_repository.dart';
import 'package:flutter_app/ui/pages/forgot_pass/check_your_mail_screen.dart';
import 'package:flutter_app/ui/pages/forgot_pass/forgot_pass_screen.dart';
import 'package:flutter_app/ui/pages/home/home_screen.dart';
import 'package:flutter_app/ui/pages/incoming_document_detail/pdf_viewer_screen.dart';
import 'package:flutter_app/ui/pages/login/login_screen.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/reminder_calendar_screem.dart';
import 'package:flutter_app/ui/pages/settings/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../ui/pages/incoming_document_detail/inc_doc_detail_screen.dart';
import '../ui/pages/splash/splash_screen.dart';

class HomeArguments {
  final String title;
  final int number;

  const HomeArguments({required this.title, required this.number});
}

class IncomingDocumentDetailArgs {
  final int documentId;

  const IncomingDocumentDetailArgs({required this.documentId});
}

class PdfViewerArguments {
  final String title;
  final String pdfUrl;

  const PdfViewerArguments({required this.title, required this.pdfUrl});
}



class MyRouter {
  static const String splash = '/';
  static const String setting = '/setting';

  //DOC
  static const String homeScreen = '/home-screen';
  static const String login = '/login';
  static const String forgotPassword = "/forgot-password";
  static const String checkYourMail = "/check-your-mail";
  static const String reminder = "/reminder";
  static const String incomingDocumentDetail = "/incomingDocumentDetail";
  static const String pdfViewer = "/pdfViewer";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case incomingDocumentDetail:
        if (args is IncomingDocumentDetailArgs) {
          return MaterialPageRoute(builder: (_) => IncomingDocumentDetail(documentId: args.documentId,));
        } else {
          return errorRoute("Wrong arguments for IncomingDocumentDetail");
        }
      case pdfViewer:
        if (args is PdfViewerArguments) {
          return MaterialPageRoute(builder: (_) => PdfViewer(title: args.title, url: args.pdfUrl));
        } else {
          return errorRoute("Wrong arguments for PdfViewer");
        }
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassScreen());
      case checkYourMail:
        return MaterialPageRoute(builder: (_) => const CheckYourMailScreen());
      case setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case reminder:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => DocumentReminderBloc(
                    DocumentReminderRepository(
                        "${UrlConst.DOC_SERVICE_URL}/document-reminders/current-user")),
                child: const ReminderCalendarScreen()));
      default:
        return errorRoute("No route-name founded");
    }
  }

  static Route<dynamic> errorRoute(String errorMsg) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for $errorMsg'),
              ),
            ));
  }
}
