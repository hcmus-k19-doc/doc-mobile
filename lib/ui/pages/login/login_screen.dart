import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/login/widgets/login_form_field.dart';
import 'package:flutter_app/ui/pages/login/widgets/sign_in_btn.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/export_constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacementNamed(context, MyRouter.baseScreen);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: StyleConst.defaultPadding24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //App name Text
                      Image.asset(
                        ImagesPath.logo,
                        height: screenSize.height / 3,
                      ),

                      Text("Document approval and distribution system",
                          textAlign: TextAlign.center,
                          style: headLineSmall(context)),
                      const SizedBox(
                        height: 34,
                      ),

                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              //textField email and password
                              LoginFormField(
                                usernameTextEditingController:
                                    usernameEditingController,
                                passwordTextEditingController:
                                    passwordEditingController,
                              ),

                              Container(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return Colors.transparent;
                                      },
                                    ),
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  child: Text(
                                    "Forgot your password?",
                                    style: bodyLarge(context)
                                        ?.copyWith(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRouter.forgotPassword);
                                  },
                                ),
                              ),
                              //Sign in btn

                              Visibility(
                                visible: state is AuthError ? true : false,
                                child: Text(
                                  "Failed to Login",
                                  style: bodyLargeBold(context)
                                      ?.copyWith(color: Colors.red),
                                ),
                              ),

                              const SizedBox(
                                height: StyleConst.defaultPadding12,
                              ),

                              SignInBtn(
                                formKey: _formKey,
                                usernameTextEditingController:
                                    usernameEditingController,
                                passwordTextEditingController:
                                    passwordEditingController,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, MyRouter.setting);
                                },
                                child: Text('Test'),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
