import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_app_3/core/app_platform.dart';

Widget webView(String link) {
  if (link.isNotEmpty) {
    if (AppPlatform.isMobile) {
      return WebView(initialUrl: link);
    } else {
      return Hyperlink(link: link);
    }
  } else {
    return const SizedBox.shrink();
  }
}

class Hyperlink extends StatelessWidget {
  const Hyperlink({Key? key, required this.link}) : super(key: key);
  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text(
          link,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
      ),
      onTap: () {
        // launch(link);
        launchUrl(Uri.parse(link));
      },
    );
  }
}
