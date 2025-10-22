import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  final String url;

  const WebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(Uri.parse(url));

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          context.go(Routes.welcome);
        }
      },
      child: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}