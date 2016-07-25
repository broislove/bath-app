import 'package:flutter/material.dart';

import 'events.dart';
import 'mraz.dart';

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

final List<String> guestList = [
  "Paul Glotov",
  "Anton Ryadinsky",
  "Bro Chislov",
  "Kest Man'ko",
  "Gleb Chernov",
  "Ruslan Sokolov",
  "Timur Irgalin",
  "Paul Grivin",
  "Kostya Fyodorov",
  "Max Vinogradov",
  "Alex Sterinovich",
  "Peter Kropotin",
  "Fomich Fomin",
  "Max Khohrin",
  "Marat Uramaev",
  "Tema Razglyadny",
  "Vova Egorov",
  "Serge Nekrashevich",
  "Kirill Khohrin"
];

/*final*/ List<Tab> tabs = <Tab>[
  new Tab(
    label: 'THE M',
    viewWidget: new TabMraz(guests: guestList),
    icon: Icons.block,
  //  action:  bathEventList.addEvent(),
    tooltip: "Who's MRAZ'?"
  ),
  new Tab(
    label: 'EVENTS',
    viewWidget: new BathEventsList(),
    icon: Icons.add,
  //  action:  bathEventList.addEvent(),
    tooltip: 'Add new event'
  ),
  new Tab(
    label: 'STATS',
    viewWidget: new TabStats()
  )
];
