// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'item.dart';
import 'home.dart';

final Map<String, WidgetBuilder> _kRoutes = new Map<String, WidgetBuilder>.fromIterable(
  kAllGalleryItems,
  key: (GalleryItem item) => item.routeName,
  value: (GalleryItem item) => item.buildRoute
);

final ThemeData _kGalleryLightTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal
);

final ThemeData _kGalleryDarkTheme = new ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal
);

class GalleryApp extends StatefulWidget {
  GalleryApp({ Key key }) : super(key: key);

  @override
  GalleryAppState createState() => new GalleryAppState();
}

class GalleryAppState extends State<GalleryApp> {
  bool _useLightTheme = true;
  bool _showPerformanceOverlay = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Gallery',
      theme: _useLightTheme ? _kGalleryLightTheme : _kGalleryDarkTheme,
      showPerformanceOverlay: _showPerformanceOverlay,
      routes: _kRoutes,
      home: new GalleryHome(
        useLightTheme: _useLightTheme,
        onThemeChanged: (bool value) { setState(() { _useLightTheme = value; }); },
        showPerformanceOverlay: _showPerformanceOverlay,
        onShowPerformanceOverlayChanged: (bool value) { setState(() { _showPerformanceOverlay = value; }); },
        timeDilation: timeDilation,
        onTimeDilationChanged: (double value) { setState(() { timeDilation = value; }); }
      )
    );
  }
}
