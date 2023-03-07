import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/constants/value_const.dart';
import 'package:flutter_app/ui/pages/login/widgets/login_form_field.dart';
import 'package:flutter_app/ui/pages/login/widgets/sign_in_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocConsumer(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamed(context, "base-screen");
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: StyleConst.defaultPadding),
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
                          style:
                              FontConst.MEDIUM_BLACK2.copyWith(fontSize: 18)),

                      const SizedBox(
                        height: 34,
                      ),

                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              //textField email and password
                              const LoginFormField(),

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
                                  child: Text("Forgot your password?"),
                                  onPressed: () {
                                    print("Forgot password");
                                  },
                                ),
                              ),
                              //Sign in btn

                              Visibility(
                                visible: state is LoginFailure ? true : false,
                                child: Text(
                                  "Fail to Login",
                                  style: FontConst.medium
                                      .copyWith(color: Colors.red),
                                ),
                              ),

                              const SizedBox(
                                height: StyleConst.defaultPadding / 2,
                              ),

                              SignInBtn(formKey: _formKey)
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
