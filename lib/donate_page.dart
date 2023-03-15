import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final _webViewKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate'),
      ),
      body: WebView(
        key: _webViewKey,
        initialUrl:
            'https://www.example.com', // Replace with your actual donation page URL
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
