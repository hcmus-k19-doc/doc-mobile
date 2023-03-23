import 'package:flutter/material.dart';
import 'package:flutter_app/ui/common_widgets/confirm_dialog.dart';
import 'package:flutter_app/ui/pages/settings/widgets/menu_widget.dart';

import '../../../app/router.dart';
import '../../../constants/export_constants.dart';
import '../../../utils/utils.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isLightMode = true;
  bool _isVietnamese = true;
  final List<bool> _notifications = [true, true, false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        // padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nguyễn Đức Nam',
                              style: bodyLargeBold(context)
                                  ?.copyWith(color: Colors.white, fontSize: 18),
                              maxLines: 1,
                            ),
                            Text(
                              'Văn thư',
                              style: bodyLarge(context)
                                  ?.copyWith(color: Colors.white),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            shape: BoxShape.rectangle,
                          ),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.blue,
                            size: 24,
                          )),
                      onTap: () {
                        onPressedLogOut(context, size);
                      },
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Account",
                    style: headLineSmall(context)?.copyWith(
                        height: ConstValue.courseNameTextScale, fontSize: 18),
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                  ExpansionTile(
                    title:  Text(
                      "Basic information",
                      style: bodyLarge(context),
                    ),
                    initiallyExpanded: true,
                    tilePadding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                    children: <Widget>[
                      ListTile(title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Họ và tên: ",
                                style: bodyLargeBold(context)),
                            TextSpan(
                                text: "Nguyễn Đức Nam",
                                style: bodyLarge(context))
                          ])),),
                      ListTile(title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Chức vụ: ",
                                style: bodyLargeBold(context)),
                            TextSpan(
                                text: "Văn thư",
                                style: bodyLarge(context))
                          ])),),
                      ListTile(title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Phòng ban: ",
                                style: bodyLargeBold(context)),
                            TextSpan(
                                text: "Khoa CNTT",
                                style: bodyLarge(context))
                          ])),),
                      ListTile(title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Ngày sinh: ",
                                style: bodyLargeBold(context)),
                            TextSpan(
                                text: "19/04/2001",
                                style: bodyLarge(context))
                          ])),),
                    ],
                  ),
                  MenuWidget(
                      title: 'Menu 2 (navigate to home)',
                      callback: () {
                        //TODO FIX NAVIGATOR
                        Navigator.pushReplacementNamed(context, MyRouter.baseScreen);
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Application",
                    style: headLineSmall(context)?.copyWith(
                        height: ConstValue.courseNameTextScale, fontSize: 18),
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                  ExpansionTile(
                    title:  Text(
                      "Notifications",
                      style: bodyLarge(context),
                    ),
                    tilePadding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                    childrenPadding: const EdgeInsets.fromLTRB(12, 0, 2, 0),
                    children: <Widget>[
                      ListTile(title: Text("Receive in-app notification",
                          style: bodyLarge(context)),
                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        trailing:  Switch(
                          // This bool value toggles the switch.
                          value: _notifications[0],
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              _notifications[0] = value;
                            });
                          },
                        ),
                      ),
                      ListTile(title: Text("Receive email",
                          style: bodyLarge(context)),
                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        trailing:  Switch(
                          // This bool value toggles the switch.
                          value: _notifications[1],
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              _notifications[1] = value;
                            });
                          },
                        ),
                      ),
                      ListTile(title: Text("Receive SMS text",
                          style: bodyLarge(context)),
                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        trailing:  Switch(
                          // This bool value toggles the switch.
                          value: _notifications[2],
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              _notifications[2] = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title:  Text(
                      "Language",
                      style: bodyLarge(context),
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(12, 0, 2, 0),
                    tilePadding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                    children: <Widget>[
                      ListTile(title: Text("Vietnamese",
                          style: bodyLarge(context)),
                        contentPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                        leading: Image.asset(
                          ImagesPath.vietnam,
                          fit: BoxFit.fitHeight,
                          height: 18,
                        ),
                        trailing: _isVietnamese? const Icon(Icons.radio_button_checked, color: Colors.blue, size: 18):
                        const Icon(Icons.radio_button_off, color: Colors.black45, size: 18),
                        onTap: (){
                          setState(() {
                            _isVietnamese = true;
                          });
                        },
                      ),
                      ListTile(title: Text("English",
                          style: bodyLarge(context)),
                        contentPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                        leading: Image.asset(
                          ImagesPath.english,
                          fit: BoxFit.fitHeight,
                          height: 18,
                        ),
                        trailing: !_isVietnamese? const Icon(Icons.radio_button_checked, color: Colors.blue, size: 18,):
                        const Icon(Icons.radio_button_off, color: Colors.black45, size: 18),
                        onTap: (){
                          setState(() {
                            _isVietnamese = false;
                          });
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title:  Text(
                      "Dark mode",
                      style: bodyLarge(context),
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(12, 0, 2, 0),
                    tilePadding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                    children: <Widget>[
                      ListTile(title: Text("Light mode",
                          style: bodyLarge(context)),
                        contentPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                        leading: const Icon(Icons.sunny, color: Colors.yellow),
                        trailing: _isLightMode? const Icon(Icons.radio_button_checked, color: Colors.blue, size: 18):
                        const Icon(Icons.radio_button_off, color: Colors.black45, size: 18),
                        onTap: (){
                        setState(() {
                          _isLightMode = true;
                        });
                        },
                      ),
                      ListTile(title: Text("Dark mode",
                          style: bodyLarge(context)),
                        contentPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                        leading: const Icon(Icons.nights_stay, color: Colors.lightBlue,),
                        trailing: !_isLightMode? const Icon(Icons.radio_button_checked, color: Colors.blue, size: 18,):
                        const Icon(Icons.radio_button_off, color: Colors.black45, size: 18),
                        onTap: (){
                          setState(() {
                            _isLightMode = false;
                          });
                        },
                      ),
                      ExpansionTile(
                        title:  Text(
                          "Contact for support",
                          style: bodyLarge(context),
                        ),

                        tilePadding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                        children: <Widget>[
                          ListTile(title: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Hotline:",
                                    style: bodyLargeBold(context)),
                                TextSpan(
                                    text: " 0988012170",
                                    style: bodyLarge(context))
                              ])),),
                          ListTile(title: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Email:",
                                    style: bodyLargeBold(context)),
                                TextSpan(
                                    text: " hcmus@edu.com.vn",
                                    style: bodyLarge(context))
                              ])),),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title:  Text(
                      "Application information",
                      style: bodyLarge(context),
                    ),

                    tilePadding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                    children: <Widget>[
                      ListTile(title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Version: ",
                                style: bodyLargeBold(context)),
                            TextSpan(
                                text: " 1.0.0",
                                style: bodyLarge(context))
                          ])),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPressedLogOut(BuildContext context, Size size) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            size: size,
            content: "Do you want to log out?",
            title: 'Logout',
            onRightButton: () {
              pushUntilLogin(context);
            },
            onLeftButton: () {
              Navigator.of(context).pop();
            },
            leftButton: 'No',
            rightButton: 'Yes',
            hasLeftButton: true,
          );
        });
  }
}
