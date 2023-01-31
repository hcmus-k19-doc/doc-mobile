import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constants/export_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.number}) : super(key: key);
  final int number;
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String getInfo = "";

  static Future<String> getDeviceDetails() async {
    String deviceName = "";
    String deviceVersion = "";
    String identifier = "";
    final deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.sdkInt.toString();
        identifier = build.id;  //UUID for Android
      } else if (Platform.isIOS) {
        var build = await deviceInfoPlugin.iosInfo;
        deviceName = build.model.toString();
        deviceVersion = build.systemVersion.toString();
        identifier = build.identifierForVendor.toString();  //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

    String result = "Device name: $deviceName, version: $deviceVersion, UUID: $identifier";

//if (!mounted) return;
    return result;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      getDeviceDetails().then((value) => { getInfo = value});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_counter == 0) _counter = widget.number;
    var deviceInfo = getInfo;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Device info:',
            ),
            Container(
              margin: const EdgeInsets.only(left:30, bottom: 20, right: 20, top:10),
              child: Text(
              deviceInfo,
              style: Theme.of(context).textTheme.headline4,
            ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      backgroundColor: ColorConst.white,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
