import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'hello-html',
      (int viewId) => AnchorElement(
          href:
              'https://twitter.com/na8esin/lists/1438080785391575041?ref_src=twsrc%5Etfw')
        ..className = 'twitter-timeline'
        // appendHtml, innerHtmlなどでは下記のメッセージとともに削除される
        // Removing disallowed element <SCRIPT> from [object DocumentFragment]
        ..innerHtml =
            '<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>'
        ..style.width = 'auto'
        ..style.height = 'auto');

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      body: const SizedBox(
          width: 640,
          height: 960,
          child: HtmlElementView(viewType: 'hello-html')),
    ),
  ));
}
