import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key, required this.initialUrl}) : super(key: key);
  String? initialUrl;
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: initialUrl,
    );
  }
}
