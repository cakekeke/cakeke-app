import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/utils/webview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CurationPage extends StatefulWidget {
  CurationPage({super.key});

  @override
  State<CurationPage> createState() => _CurationPageState();
}

class _CurationPageState extends State<CurationPage> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(webviewUrl));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        if (isLoading)
          Center(
            child: CircularProgressIndicator(
              color: DesignSystem.colors.appPrimary,
            ),
          ),
      ],
    ));
  }
}
