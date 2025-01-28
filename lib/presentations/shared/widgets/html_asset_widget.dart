import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../themes/colors.dart';

class HtmlAssetWidget extends StatelessWidget {
  final String filePath;

  const HtmlAssetWidget({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: rootBundle.loadString(filePath),
            builder: (c, d) {
              if (!d.hasData) {
                return const Center(
                    child: CircularProgressIndicator(color: primaryColor));
              }
              return HtmlWidget(d.data!, textStyle: TextStyle(fontSize: 15));
            }));
  }
}
