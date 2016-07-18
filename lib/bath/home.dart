import 'package:flutter/material.dart';

import 'tabs.dart';
//import 'dialogues.dart';


class BathHome extends StatefulWidget {
  BathHome({ Key key }) : super(key: key);

  @override
  BathHomeState createState() => new BathHomeState();
}

class BathHomeState extends State<BathHome> {
  final Key _homeKey = new ValueKey<String>("BathApp Home"); //???

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarSelection<Tab>(
      values: kTabs,
      onChanged: null,
      child: new Scaffold(
        key: _homeKey,
        appBar: new AppBar(
            title: new Text('BathApp!'),
            actions: <Widget>[new IconButton(
                icon: new Icon(Icons.info),
                tooltip: 'About',
                onPressed: null
            )],
            bottom: new TabBar<Tab>(
              labels: new Map<Tab, TabLabel>.fromIterable(kTabs, value: (Tab tab) {
                return new TabLabel(text: tab.label);
              })
            )
        ),
        body: new TabBarView<Tab>(
          children: kTabs.map((Tab tab) {
            return tab.viewWidget;
          }).toList()
        ),
        floatingActionButton: new FloatingActionButton(
          tooltip: 'Add event',
          child: new Icon(Icons.add),
          onPressed: null
        )
      )
    );
  }
}
