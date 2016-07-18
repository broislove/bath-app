import 'package:flutter/material.dart';

import 'home.dart';

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
      home: new BathHome()
    );
  }
}
