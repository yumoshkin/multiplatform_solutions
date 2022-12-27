import 'package:flutter_app_3/core/mock_webview.dart'
    if (dart.library.io) 'package:flutter_app_3/core/non_web_platform_webview.dart'
    if (dart.library.html) 'package:flutter_app_3/core/web_platform_webview.dart';

import 'package:flutter/material.dart';

class SiteInfoBox extends StatelessWidget {
  const SiteInfoBox({
    Key? key,
    required this.siteTitle,
    required this.corsHeader,
    required this.link,
  }) : super(key: key);
  final String siteTitle;
  final String corsHeader;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            siteTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            corsHeader,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: webView(link),
          ),
        ],
      ),
    );
  }
}
