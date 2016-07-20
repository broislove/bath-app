import 'package:flutter/material.dart';

import 'items.dart';

class Tab {
  Tab({ this.label, this.viewWidget});

  final String label;
  final Widget viewWidget;
}
 // << HUINYA!!!
Widget statsW = new Center(
  child: new Card(
    child: new Center(
      child: new Text('Put STATS here')
    )
  )
);

Widget eventsW = new Block(
  children: prepareEvents(kAllBathEvents)
);

// >>

final List<Tab> kTabs = <Tab>[
  new Tab(label: 'EVENTS', viewWidget: eventsW),
  new Tab(label: 'STATS', viewWidget: statsW),
];
