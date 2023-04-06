import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/export_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthBloc authBloc;
  late String? accessTokenLocalStorage;
  late String? refressTokenLocalStorage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    accessTokenLocalStorage =
        await SecuredLocalStorage().readString(KEY_CONST.ACCESS_TOKEN_KEY);

    refressTokenLocalStorage =
        await SecuredLocalStorage().readString(KEY_CONST.REFRESH_TOKEN_KEY);
    authBloc.add(
        CheckTokenEvent(accessTokenLocalStorage, refressTokenLocalStorage));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError || state is UnAuthenticated) {
          Navigator.pushReplacementNamed(context, MyRouter.login);
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, MyRouter.homeScreen);
        }
      },
      child: Scaffold(
        body: const Center(
          child: Text("This is Splash Screen"),
        ),
        backgroundColor: ColorConst.white,
      ),
    );
  }
}
