import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/change_pass/change_pass_bloc.dart';
import 'package:flutter_app/bloc/forgot_pass_bloc/forgot_pass_bloc.dart';
import 'package:flutter_app/bloc/transfer_history_bloc/transfer_history_bloc.dart';
import 'package:flutter_app/constants/api_const.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:flutter_app/ui/common_widgets/pdf_viewer_screen.dart';
import 'package:flutter_app/ui/pages/change_pass/change_pass_screen.dart';
import 'package:flutter_app/ui/pages/document_detail/out_doc_detail_screen.dart';
import 'package:flutter_app/ui/pages/forgot_pass/check_your_mail_screen.dart';
import 'package:flutter_app/ui/pages/forgot_pass/forgot_pass_screen.dart';
import 'package:flutter_app/ui/pages/home/home_screen.dart';
import 'package:flutter_app/ui/pages/login/login_screen.dart';
import 'package:flutter_app/ui/pages/profile/profile_screen.dart';
import 'package:flutter_app/ui/pages/settings/settings_screen.dart';
import 'package:flutter_app/ui/pages/transfer_history/transfer_history_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/pages/document_detail/inc_doc_detail_screen.dart';
import '../ui/pages/splash/splash_screen.dart';

class HomeArguments {
  final String title;
  final int number;

  const HomeArguments({required this.title, required this.number});
}

class DocumentDetailArgs {
  final int documentId;

  const DocumentDetailArgs({required this.documentId});
}

class PdfViewerArguments {
  final String title;
  final String url;
  final bool isPdf;

  const PdfViewerArguments(
      {required this.title, required this.url, required this.isPdf});
}

class TransferHistoryArgs {
  final TransferHistoryBloc transferHistoryBloc;

  TransferHistoryArgs(this.transferHistoryBloc);
}

class MyRouter {
  static const String splash = '/';
  static const String setting = '/setting';

  //DOC
  static const String homeScreen = '/home-screen';
  static const String login = '/login';
  static const String forgotPassword = "/forgot-password";
  static const String checkYourMail = "/check-your-mail";
  static const String changePassword = "/change-password";
  static const String incomingDocumentDetail = "/incomingDocumentDetail";
  static const String outgoingDocumentDetail = "/outgoingDocumentDetail";
  static const String pdfViewer = "/pdfViewer";
  static const String profile = "/profile";
  static const String transferHistory = "/transfer-history";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case incomingDocumentDetail:
        if (args is DocumentDetailArgs) {
          return MaterialPageRoute(
              builder: (_) => IncomingDocumentDetail(
                    documentId: args.documentId,
                  ));
        } else {
          return errorRoute("Wrong arguments for IncomingDocumentDetail");
        }
      case outgoingDocumentDetail:
        if (args is DocumentDetailArgs) {
          return MaterialPageRoute(
              builder: (_) => OutgoingDocumentDetail(
                    documentId: args.documentId,
                  ));
        } else {
          return errorRoute("Wrong arguments for IncomingDocumentDetail");
        }
      case pdfViewer:
        if (args is PdfViewerArguments) {
          return MaterialPageRoute(
              builder: (_) => PdfViewer(
                    title: args.title,
                    url: args.url,
                    isPdf: args.isPdf,
                  ));
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
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ForgotPassBloc(AuthRepository(
                      "${UrlConst.DOC_SERVICE_URL}/security/auth")),
                  child: ForgotPassScreen(),
                ));
      case checkYourMail:
        return MaterialPageRoute(builder: (_) => const CheckYourMailScreen());
      case setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case changePassword:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChangePassBloc(
                      UserRepository("${UrlConst.DOC_SERVICE_URL}/users")),
                  child: ChangePasswordScreen(),
                ));
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case transferHistory:
        {
          if (args is TransferHistoryArgs) {
            return MaterialPageRoute(
                builder: (_) => TransferHistoryScreen(
                      transferHistoryBloc: args.transferHistoryBloc,
                    ));
          } else {
            return errorRoute("Wrong arguments for PdfViewer");
          }
        }
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
