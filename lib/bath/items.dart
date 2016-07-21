import 'package:flutter/material.dart';

class Event {
  Event({this.id, this.title, this.date, this.visitors});

  final int id;
  final String title;
  final String date;
  final List<int> visitors;
}

class BathEvent extends StatelessWidget {
  BathEvent({ this.id, this.title, this.date, this.routeName, this.buildRoute});

  final int id;
  final String title;
  final String date;

  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  Widget build(BuildContext context) {
    //final ThemeData themeData = Theme.of(context);
    //final TextStyle titleStyle = themeData.textTheme.body2.copyWith(color: themeData.primaryColor);

    return new ListItem(
      title: new Text('S${id.toString().substring(0,1)} Ep' +
       '${id.toString().substring(1,3)}'), //, style: titleStyle
      subtitle: new Text(title),
      onTap: (){
        Navigator.pushNamed(context, routeName);
      }
    );
  }
}

class BathEventDetails extends StatelessWidget{
  BathEventDetails({this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(id.toString())
      ),
      body: new Center(
        child: new Card(
          child: new Center(
            child: new Text(id.toString())
          )
        )
      )
    );
  }
}

final List<BathEvent> kAllBathEvents = <BathEvent>[
  new BathEvent(
    id: 212,
    title: 'The end of Anarchy',
    routeName: '212',
    buildRoute: (BuildContext context) => new BathEventDetails(id: 212)
  ),
  new BathEvent(
    id: 211,
    title: 'Future is Unknown',
    routeName: '211',
    buildRoute: (BuildContext context) => new BathEventDetails(id: 211)
  ),
  new BathEvent(
    id: 210,
    title: 'Bottle & Egg',
    routeName: '210',
    buildRoute: (BuildContext context) => new BathEventDetails(id: 210)
  ) /*,
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
  )*/
];
