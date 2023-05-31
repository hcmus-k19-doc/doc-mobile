import 'package:flutter/material.dart';

import '../../../constants/export_constants.dart';

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
    EdgeInsets tilePadding = const EdgeInsets.fromLTRB(0, 0, 2, 0);
    EdgeInsets childrenPadding = const EdgeInsets.fromLTRB(12, 0, 2, 0);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Cài đặt",
        style: headLineSmall(context)?.copyWith(color: Colors.white),
      )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        "Ứng dụng",
                        style: bodyLarge(context),
                      ),
                      tilePadding: tilePadding,
                      childrenPadding: childrenPadding,
                      children: <Widget>[
                        ListTile(
                          title: Text("Lưu phiên đăng nhập",
                              style: bodyLarge(context)),
                          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          trailing: Switch(
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
                        ListTile(
                          title: Text("Nhận thông báo từ ứng dụng",
                              style: bodyLarge(context)),
                          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          trailing: Switch(
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
                        ListTile(
                          title: Text("Nhận thông báo qua Mail/SMS",
                              style: bodyLarge(context)),
                          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          trailing: Switch(
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
                      initiallyExpanded: true,
                      title: Text(
                        "Ngôn ngữ",
                        style: bodyLarge(context),
                      ),
                      childrenPadding: childrenPadding,
                      tilePadding: tilePadding,
                      children: <Widget>[
                        ListTile(
                          title: Text("Vietnamese", style: bodyLarge(context)),
                          contentPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                          leading: Image.asset(
                            ImagesPath.vietnam,
                            fit: BoxFit.fitHeight,
                            height: 18,
                          ),
                          trailing: _isVietnamese
                              ? const Icon(Icons.radio_button_checked,
                                  color: Colors.blue, size: 18)
                              : const Icon(Icons.radio_button_off,
                                  color: Colors.black45, size: 18),
                          onTap: () {
                            setState(() {
                              _isVietnamese = true;
                            });
                          },
                        ),
                        ListTile(
                          title: Text("English", style: bodyLarge(context)),
                          contentPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                          leading: Image.asset(
                            ImagesPath.english,
                            fit: BoxFit.fitHeight,
                            height: 18,
                          ),
                          trailing: !_isVietnamese
                              ? const Icon(
                                  Icons.radio_button_checked,
                                  color: Colors.blue,
                                  size: 18,
                                )
                              : const Icon(Icons.radio_button_off,
                                  color: Colors.black45, size: 18),
                          onTap: () {
                            setState(() {
                              _isVietnamese = false;
                            });
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        "Chế độ nền",
                        style: bodyLarge(context),
                      ),
                      childrenPadding: childrenPadding,
                      tilePadding: tilePadding,
                      children: <Widget>[
                        ListTile(
                          title: Text("Nền sáng", style: bodyLarge(context)),
                          contentPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                          leading:
                              const Icon(Icons.sunny, color: Colors.yellow),
                          trailing: _isLightMode
                              ? const Icon(Icons.radio_button_checked,
                                  color: Colors.blue, size: 18)
                              : const Icon(Icons.radio_button_off,
                                  color: Colors.black45, size: 18),
                          onTap: () {
                            setState(() {
                              _isLightMode = true;
                            });
                          },
                        ),
                        ListTile(
                          title: Text("Nền tối", style: bodyLarge(context)),
                          contentPadding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                          leading: const Icon(
                            Icons.nights_stay,
                            color: Colors.lightBlue,
                          ),
                          trailing: !_isLightMode
                              ? const Icon(
                                  Icons.radio_button_checked,
                                  color: Colors.blue,
                                  size: 18,
                                )
                              : const Icon(Icons.radio_button_off,
                                  color: Colors.black45, size: 18),
                          onTap: () {
                            setState(() {
                              _isLightMode = false;
                            });
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        "Hỗ trợ",
                        style: bodyLarge(context),
                      ),
                      tilePadding: tilePadding,
                      children: <Widget>[
                        ListTile(
                          title: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Hotline:",
                                style: bodyLargeBold(context)),
                            TextSpan(
                                text: " 0988012170", style: bodyLarge(context))
                          ])),
                        ),
                        ListTile(
                          title: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Email:", style: bodyLargeBold(context)),
                            TextSpan(
                                text: " hcmus@edu.com.vn",
                                style: bodyLarge(context))
                          ])),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        "Phiên bản ứng dụng",
                        style: bodyLarge(context),
                      ),
                      tilePadding: tilePadding,
                      children: <Widget>[
                        ListTile(
                          title: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Version: ",
                                style: bodyLargeBold(context)),
                            TextSpan(text: " 1.0.0", style: bodyLarge(context))
                          ])),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
