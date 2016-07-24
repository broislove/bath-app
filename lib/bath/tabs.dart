import 'package:flutter/material.dart';

import 'events.dart';

BathEventsList bathEventList = new BathEventsList();

class Tab {
  Tab({ this.label, this.viewWidget, this.icon, this.tooltip, this.action });

  final String label;
  final String tooltip;
  final Widget viewWidget;
  final IconData icon;
  final VoidCallback action;

  bool get fabDefined => icon != null;
  Icon get fabIcon => new Icon(icon);
  String get toolTip => tooltip;
  VoidCallback get fabAction => action;
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

final List<Tab> tabs = <Tab>[
  new Tab(
    label: 'EVENTS',
    viewWidget: bathEventList,
    icon: Icons.add,
    action:  bathEventList.addEvent(),
    tooltip: 'Add new event'
  ),
  new Tab(
    label: 'STATS',
    viewWidget: new TabStats()
  )
];
