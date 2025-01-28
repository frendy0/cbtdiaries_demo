import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/widgets/bouncing_widget.dart';
import '../../shared/widgets/default_app_bar.dart';
import '../../shared/widgets/header_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: DefaultAppBar(title: Text("Settings")),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Bouncing(
                    onPress: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 7)
                          ]),
                      child: Row(children: [
                        const Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(Icons.login, size: 50))),
                        Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container())
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Bouncing(
                    onPress: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 7)
                          ]),
                      child: Row(children: [
                        const Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    Icon(Icons.lock_clock_outlined, size: 50))),
                        Text(
                          "SUBSCRIPTION",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container())
                      ]),
                    ),
                  ),
                  const Spacer(),
                  Bouncing(
                    onPress: _feedback,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 7)
                          ]),
                      child: Row(children: [
                        const Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(Icons.forum_outlined, size: 50))),
                        Text(
                          "FEEDBACK",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: Container())
                      ]),
                    ),
                  ),
                  Align(
                      child: CupertinoButton(
                    onPressed: () =>
                        _launchUrl('https://www.linkedin.com/in/alexfrendy/'),
                    child: Text(
                      "PRIVACY POLICY",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom,
                  )
                ],
              )),
        ));
  }

  void _launchUrl(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _feedback() {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Column(
            children: [
              const HeaderBottomSheet(
                title: Text('Feedback'),
              ),
              ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('a@serenko.me'),
                  onTap: _sendEmail),
              ListTile(
                leading: const Icon(Icons.contact_page),
                title: const Text('@alexfrendy'),
                onTap: () =>
                    _launchUrl("https://www.linkedin.com/in/alexfrendy/"),
              ),
              const Spacer(),
              SizedBox(
                height: 5,
              ),
              if (FirebaseAuth.instance.currentUser != null)
                Text('ID: ${FirebaseAuth.instance.currentUser?.uid}'),
              const SafeArea(
                  top: false,
                  child: SizedBox(
                    height: 10,
                  ))
            ],
          );
        });
  }

  void _sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'a@serenko.me',
      queryParameters: {'subject': "Feedback"},
    );
    launchUrl(emailLaunchUri);
  }
}
