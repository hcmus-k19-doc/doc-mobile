import 'package:flutter/material.dart';
import 'package:flutter_app/app/my_router.dart';
import '../../constants/export_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Splash screen:',
            ),
          ],
        ),
      ),
      backgroundColor: ColorConst.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, MyRouter.home, arguments: ScreenArguments(title: title, number: 5));
          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
