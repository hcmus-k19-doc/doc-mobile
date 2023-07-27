import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/main.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/ui/pages/splash/widgets/animation_widget.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/export_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AuthBloc authBloc;
  late String? accessTokenLocalStorage;
  late String? refressTokenLocalStorage;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;
  late RemoteMessage? initialMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);

    //animation controller

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    //rotation animation

    _rotationAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    //radius animation
    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    accessTokenLocalStorage =
        await SecuredLocalStorage().readString(KEY_CONST.ACCESS_TOKEN_KEY);

    refressTokenLocalStorage =
        await SecuredLocalStorage().readString(KEY_CONST.REFRESH_TOKEN_KEY);
    Clipboard.setData(ClipboardData(text: accessTokenLocalStorage));
    initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    authBloc.add(
        CheckTokenEvent(accessTokenLocalStorage, refressTokenLocalStorage));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError || state is UnAuthenticated) {
          authBloc.add(ClearAuthentication());
          Navigator.pushReplacementNamed(context, MyRouter.login);
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, MyRouter.homeScreen);
          if (initialMessage != null) {
            Future.delayed(const Duration(seconds: 1), () {
              if (initialMessage == null) return;
              try {
                String? documentType =
                    initialMessage?.data["processingDocumentType"];
                String? documentId = initialMessage?.data["documentId"];
                if (documentType != null && documentId != null) {
                  int docId = int.parse(documentId);
                  navigatorKey.currentState?.pushNamed(
                      documentType == "INCOMING_DOCUMENT"
                          ? MyRouter.incomingDocumentDetail
                          : MyRouter.outgoingDocumentDetail,
                      arguments: DocumentDetailArgs(documentId: docId));
                }
              } catch (error) {
                print(error);
              }
            });
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimationWidget(
                rotationValue: _rotationAnimation.value,
                radiusValue: _radiusAnimation.value,
                width: 255,
                height: 255,
                colorWidget: Colors.white,
                imagePath: "assets/images/Logo_HCMUS.png",
              ),
            ],
          ),
        ),
        backgroundColor: ColorConst.primaryBlue,
      ),
    );
  }
}
