import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  final anchor = AnchorElement(
      href:
          'https://twitter.com/na8esin/lists/1438080785391575041?ref_src=twsrc%5Etfw')
    ..className = 'twitter-timeline'
    ..text = 'hello hino city';
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry
    ..registerViewFactory(
        'hello-html',
        (int viewId) => DivElement()
          ..style.overflowY = 'scroll'
          ..style.width = '300px'
          ..style.height = '500px'
          ..children = [anchor])
    ..registerViewFactory(
        'hello-javascript',
        (int viewId) => ScriptElement()
          ..src = 'https://platform.twitter.com/widgets.js'
          ..style.width = '50%'
          ..style.height = '50%'
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
