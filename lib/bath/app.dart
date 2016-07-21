import 'package:flutter/material.dart';

import 'home.dart';
import 'items.dart';

final ThemeData appTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal
);

final Map<String, WidgetBuilder> bathRoutes = new Map<String, WidgetBuilder>.fromIterable(
  kAllBathEvents,
  key: (BathEvent item) => item.routeName,
  value: (BathEvent item) => item.buildRoute
);

class BathApp extends StatefulWidget {
  BathApp({ Key key }) : super(key: key);

  @override
  BathAppState createState() => new BathAppState();
}

class BathAppState extends State<BathApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BathApp',
      theme: appTheme,
      routes: bathRoutes,
      home: new BathHome()
    );
  }
}
