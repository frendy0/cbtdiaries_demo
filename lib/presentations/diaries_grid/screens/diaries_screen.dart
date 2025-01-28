import 'package:flutter/material.dart';

import '../../itd/screens/itd_list_screen.dart';
import '../../shared/widgets/bouncing_widget.dart';
import '../../shared/widgets/default_app_bar.dart';
import '../../shared/widgets/diary_button_widget.dart';

class DiariesScreen extends StatefulWidget {
  const DiariesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DiariesScreenState();
}

class _DiariesScreenState extends State<DiariesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(title: Text("Diaries")),
      body: SingleChildScrollView(
          child: SafeArea(
        child: GridView.count(
          crossAxisCount:
              MediaQuery.of(context).size.shortestSide > 600 ? 3 : 2,
          crossAxisSpacing: 15,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 15,
          padding: const EdgeInsets.all(15),
          children: [
            Bouncing(
                onPress: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (c) => const ItdListScreen()));
                },
                child: DiaryButtonWidget(
                    label: 'CBT Journal',
                    blur: Image.asset('assets/images/itd_icon_blur.jpg'),
                    background: Image.asset('assets/images/itd_icon.jpg'))),
            Bouncing(
                onPress: () {},
                child: DiaryButtonWidget(
                    label: 'Cognitive Distortions',
                    blur: Image.asset('assets/images/fad_icon_blur.jpg'),
                    background: Image.asset('assets/images/fad_icon.jpg')))
          ],
        ),
      )),
    );
  }
}
