import 'package:flutter/material.dart';

class BathEvent extends StatelessWidget {
  BathEvent({ this.id, this.title, this.isEnded });

  final int id;
  final String title;
  final bool isEnded;

  @override
  Widget build(BuildContext context) {
    return new ListItem(
      title: new Text(id.toString()),
      subtitle: new Text(title),
      onTap: null
    );
  }
}

List<Widget> prepareEvents (List<BathEvent> allBathEvents)
{
  final List<Widget> _events = <Widget>[];

  bool currentIsEnded;

  for(BathEvent bathEvent in allBathEvents){
    if (bathEvent.isEnded != currentIsEnded ){
      if (currentIsEnded != null)
        _events.add(new Divider());
      _events.add(
        new Container(
          height: 48.0,
          padding: const EdgeInsets.only(left: 16.0),
          child: new Align(
            alignment: FractionalOffset.centerLeft,
            child: new Text( bathEvent.isEnded ? 'Past' : 'Upcoming' )
          )
        )
      );
      currentIsEnded = bathEvent.isEnded;
    }
    _events.add(bathEvent);
  }

  return _events;
}

final List<BathEvent> kAllBathEvents = <BathEvent>[
  new BathEvent(
    id: 211,
    title: 'Future is Unknown',
    isEnded: false
  ),
  new BathEvent(
    id: 210,
    title: 'Bottle & Egg',
    isEnded: true
  ),
  new BathEvent(
    id: 209,
    title: 'Duck Tales',
    isEnded: true
  ),
  new BathEvent(
    id: 208,
    title: 'Dry Halfhundred',
    isEnded: true
  ),
  new BathEvent(
    id: 207,
    title: "Cocksucker's Eleven",
    isEnded: true
  ),
  new BathEvent(
    id: 206,
    title: 'Newcomer',
    isEnded: true
  ),
  new BathEvent(
    id: 205,
    title: 'On the bottom',
    isEnded: true
  ),
  new BathEvent(
    id: 204,
    title: 'Summer is coming',
    isEnded: true
  ),
  new BathEvent(
    id: 203,
    title: 'Wet revelations',
    isEnded: true
  ),
  new BathEvent(
    id: 202,
    title: 'Intrigue',
    isEnded: true
  ),
  new BathEvent(
    id: 201,
    title: 'Happy New Year!',
    isEnded: true
  )
];
