import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry
    ..registerViewFactory(
        'hello-html',
        (int viewId) => AnchorElement(
            href:
                'https://twitter.com/na8esin/lists/1438080785391575041?ref_src=twsrc%5Etfw')
          ..className = 'twitter-timeline'
          ..text = 'hello'
          ..style.width = 'auto'
          ..style.height = 'auto')
    ..registerViewFactory(
        'hello-javascript',
        (int viewId) => ScriptElement()
          ..src = 'https://platform.twitter.com/widgets.js'
          ..style.width = '100%'
          ..style.height = '100%'
          ..async = true);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      body: ListView(
        children: const [
          SizedBox(
              width: 640,
              height: 640, // 大きすぎるとscriptタグが要素から消える
              child: HtmlElementView(viewType: 'hello-html')),
          SizedBox(
              width: 1.0,
              height: 1.0,
              child: HtmlElementView(viewType: 'hello-javascript')),
        ],
      ),
    ),
  ));
}
