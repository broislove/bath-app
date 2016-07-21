import 'package:flutter/material.dart';

import 'items.dart';

class Tab {
  Tab({ this.label, this.viewWidget});

  final String label;
  final Widget viewWidget;
}

class TabEvents extends StatelessWidget{
  TabEvents(this.events);

  final List<BathEvent> events;

  @override
  Widget build(BuildContext context) {
    return new Block(
      children: events
    );
  }
}

class TabStats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Card(
        child: new Center(
          child: new Text('Put STATS here')
        )
      )
    );
  }
}

final List<Tab> kTabs = <Tab>[
  new Tab(label: 'EVENTS', viewWidget: new TabEvents(kAllBathEvents)),
  new Tab(label: 'STATS', viewWidget: new TabStats()),
];
