import 'package:flutter/material.dart';

import 'items.dart';

class Tab {
  Tab({ this.label, this.viewWidget});

  final String label;
  final Widget viewWidget;
}

// << What if TabEvents must be stateful, then _events will be created during initState()
class TabEvents extends StatelessWidget{
  final List<Widget> _events = <Widget>[];
  bool currentIsEnded;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle headerStyle = themeData.textTheme.body2.copyWith(color: themeData.primaryColor);

      for(BathEvent bathEvent in kAllBathEvents){
        if (bathEvent.isEnded != currentIsEnded ){
          if (currentIsEnded != null)
            _events.add(new Divider());
          _events.add(
            new Container(
              height: 48.0,
              padding: const EdgeInsets.only(left: 16.0),
              child: new Align(
                alignment: FractionalOffset.centerLeft,
                child: new Text( bathEvent.isEnded ? 'Past' : 'Upcoming' , style: headerStyle)
              )
            )
          );
          currentIsEnded = bathEvent.isEnded;
        }
        _events.add(bathEvent);
      }

    return new Block(
      children: _events
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
  new Tab(label: 'EVENTS', viewWidget: new TabEvents()),
  new Tab(label: 'STATS', viewWidget: new TabStats()),
];
