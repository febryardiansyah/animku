import 'dart:async';

import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubeWebView extends StatefulWidget {
  final String url;

  const YoutubeWebView({this.url});

  @override
  _YoutubeWebViewState createState() => _YoutubeWebViewState();
}

class _YoutubeWebViewState extends State<YoutubeWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColor.baseColor,
        title: Text(
          widget.url,
          style: TextStyle(fontFamily: MyFonts.baloo),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewctrl) {
              _controller.complete(webviewctrl);
            },
          );
        },
      ),
    );
  }
}
