import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/login/widgets/login_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var _loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocConsumer(
        bloc: _loginBloc,
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height / 20,
                      ),
                      //App name Text
                      Image.asset(
                        "assets/images/logo.png",
                        height: screenSize.height / 3,
                      ),

                      Text("Document approval and distribution system",
                          style:
                              FontConst.MEDIUM_BLACK2.copyWith(fontSize: 18)),

                      const SizedBox(
                        height: 34,
                      ),

                      Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [

                              LoginFormField(),

                              const SizedBox(
                                height: StyleConst.defaultPadding * 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: StyleConst.defaultPadding * 3),
                                child: ElevatedButton(
                                    onPressed: formKey.currentState == null
                                        ? null
                                        : formKey.currentState!.validate()
                                            ? () {
                                                //API test
                                                _loginBloc.add(LoginEvent(
                                                    "https://fakestoreapi.com/"));
                                              }
                                            : null,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                StyleConst.defaultRadius)),
                                        padding: const EdgeInsets.all(12)),
                                    child: Center(
                                      child: state is LoginLoading
                                          ? CircularProgressIndicator()
                                          : Text(
                                              "Sign in",
                                              style:
                                                  FontConst.SEMIBOLD_WHITE_18,
                                            ),
                                    )),
                              ),
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
