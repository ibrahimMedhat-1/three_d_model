import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ModelPage(),
    );
  }
}

const String modelUrl = 'https://modelviewer.dev/shared-assets/models/Astronaut.glb';

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  ModelPageState createState() => ModelPageState();
}

class ModelPageState extends State<ModelPage> {
  late WebViewController webViewController;
  bool showHotspot = false;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.dataFromString(, mimeType: 'text/html'))
      ..addJavaScriptChannel('m', onMessageReceived: (JavaScriptMessage) {
        // Parse message data (e.g., hotspot coordinates) and update state/call functions
        final data = jsonDecode(JavaScriptMessage.toString());
        if (data['type'] == 'hotspotClick') {
          print('Hotspot clicked at X: ${data['x']}, Y: ${data['y']}');
          // Handle hotspot interaction based on coordinates (show details, etc.)
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Model'),
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
