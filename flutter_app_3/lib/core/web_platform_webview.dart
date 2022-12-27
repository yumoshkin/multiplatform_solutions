import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

Widget webView(String link) => WebPlatforWebView(link: link);

class WebPlatforWebView extends StatelessWidget {
  const WebPlatforWebView({Key? key, required this.link}) : super(key: key);
  final String link;

  @override
  Widget build(BuildContext context) {
    if (link.isNotEmpty) {
      final id = Random().nextInt(100).toString();

      ui.platformViewRegistry
          .registerViewFactory(id, (int viewId) => IFrameElement()..src = link);

      return HtmlElementView(viewType: id);
    } else {
      return const SizedBox.shrink();
    }
  }
}
