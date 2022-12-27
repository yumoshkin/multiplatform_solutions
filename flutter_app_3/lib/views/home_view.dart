import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;

import 'package:flutter_app_3/core/app_platform.dart';
import 'package:flutter_app_3/widgets/site_info_box.dart';
import 'package:flutter_app_3/widgets/url_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = TextEditingController(text: 'https://flutter.dev');
  String _link = '';
  String _siteTitle = '';
  String _corsHeader = '';

  Future<void> _loadSiteInfoBox(String url) async {
    final result = await http.get(Uri.parse(url));

    final doc = html_parser.parse(result.body);
    final title = doc.querySelector('title');

    final cors = result.headers['access-control-allow-origin'] != null
        ? result.headers['access-control-allow-origin']!
        : 'None';

    setState(() {
      _link = url;
      _siteTitle = title!.text.trim();
      _corsHeader = 'CORS Header: $cors';
    });
  }

  void _clearSiteInfoBox() {
    setState(() {
      _link = '';
      _siteTitle = '';
      _corsHeader = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SiteInfoBox(
                siteTitle: _siteTitle,
                corsHeader: _corsHeader,
                link: _link,
              ),
            ),
            const Divider(height: 2, thickness: 2, color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: UrlTextField(controller: _controller),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {
                        _clearSiteInfoBox();
                        _loadSiteInfoBox(_controller.text);
                      },
                      child: const Text(
                        'LOAD',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'APPLICATION RUNNING ON ${AppPlatform.platform.toUpperCase()}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
