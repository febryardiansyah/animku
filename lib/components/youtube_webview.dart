import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubeWebView extends StatefulWidget {
  String url;

  YoutubeWebView({this.url});

  @override
  _YoutubeWebViewState createState() => _YoutubeWebViewState();
}

class _YoutubeWebViewState extends State<YoutubeWebView> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('youtube'),
      ),
      body: Builder(builder: (BuildContext context){
        return WebView(
          initialUrl: 'https://en.wikipedia.org/wiki/Kraken',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webviewctrl){
            _controller.complete(webviewctrl);
          },
        );
      })
    );
  }
}
