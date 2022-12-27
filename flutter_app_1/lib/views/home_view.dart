import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;

import 'package:flutter_app_1/widgets/site_info_box.dart';
import 'package:flutter_app_1/widgets/url_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = TextEditingController(text: 'https://flutter.dev');
  String _htmlText = '';
  String _siteTitle = '';
  String _corsHeader = '';

  Future<void> _loadHtmlPage(String url) async {
    final result = await http.get(Uri.parse(url));

    final doc = html_parser.parse(result.body);
    final title = doc.querySelector('title');

    final String cors = result.headers['access-control-allow-origin'] != null
        ? result.headers['access-control-allow-origin']!
        : 'None';

    setState(() {
      _htmlText = result.body;
      _siteTitle = title!.text.trim();
      _corsHeader = 'CORS Header: $cors';
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
                htmlText: _htmlText,
              ),
            ),
            const Divider(height: 2, thickness: 2, color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: UrlTextField(controller: _controller),
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
                      onPressed: () => _loadHtmlPage(_controller.text),
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
          ],
        ),
      ),
    );
  }
}
