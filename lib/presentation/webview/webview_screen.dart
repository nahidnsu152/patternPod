import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/k_app_bar.dart';

class WebviewScreen extends HookConsumerWidget {
  static const route = '/webviewScreen';
  const WebviewScreen({super.key, required this.webviewData});

  final String webviewData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const KAppBar(
        titleText: "Webview",
      ),
      body: InAppWebView(
        initialData: InAppWebViewInitialData(data: webviewData),
        // initialOptions: InAppWebViewGroupOptions(
        //   crossPlatform: InAppWebViewOptions(
        //     javaScriptEnabled: true,
        //   ),
        // ),
        onWebViewCreated: (InAppWebViewController controller) {},
      ),
    );
  }
}
