import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/my_router.dart';
import '../../constants/export_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  final String title = "Splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Splash screen',
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  final cameras = await availableCameras().then((value) {
                    final firstCamera = value.first;
                    Navigator.pushNamed(context, MyRouter.camera, arguments: CameraArguments(camera: firstCamera));
                  }
                  );
                  // Get a specific camera from the list of available cameras.
                },
                child: const Text('Camera',
                style: TextStyle(
                  color: Colors.white
                ),
                )
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRouter.home, arguments: HomeArguments(title: title, number: 5));
                },
                child: const Text('Device info',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
            )
          ],
        ),
      ),
      backgroundColor: ColorConst.white,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.pushReplacementNamed(context, MyRouter.home, arguments: ScreenArguments(title: title, number: 5));
      //     },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
