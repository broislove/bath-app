import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'dart:async';

import 'dialogues.dart';

class BathEvent {
  BathEvent({this.id, this.title, this.date, this.visitors});

  final int id;
  final String title;
  final String date;
  final List<int> visitors;
}

class BathEventsListItem extends StatelessWidget {
  BathEventsListItem({ this.event, this.onPressed });

  final BathEvent event;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    //final ThemeData themeData = Theme.of(context);
    //final TextStyle titleStyle = themeData.textTheme.body2.copyWith(color: themeData.primaryColor);

    return new ListItem(
      title: new Text('S${event.id.toString().substring(0,1)} Ep' +
       '${event.id.toString().substring(1,3)}'), //, style: titleStyle
      subtitle: new Text(event.title),
      onTap: //(){
          //Navigator.push(context, new MaterialPageRoute<DialogActions>(
          //builder: (BuildContext context) => new BathEventDetails(event)
          //));
          onPressed
      //}
    );
  }
}

class BathEventsList extends StatefulWidget{
  BathEventsList({ Key key }) : super(key: key);

  @override
  BathEventsListState createState() => new BathEventsListState();
}

class BathEventsListState extends State<BathEventsList>{

  String loadedResources;
  List jsonResources;
  List<Widget> bathEventsListItems = <Widget>[];

  Future<String> getResources() async {
    String s;
    if (s == null)
      s = await rootBundle.loadString('assets/events.json');
    return s;
  }

  @override
  void initState() {
    super.initState();

    getResources().then((String resources){
      setState(() {
         loadedResources = resources;
         jsonResources = JSON.decode(loadedResources);
         jsonResources.forEach((j) {
           BathEvent b = new BathEvent(id: j['id'], title: j['title']);
           bathEventsListItems.add(
             new BathEventsListItem(event: b, onPressed: (){addEvent();})
           );
         });
      });
    });
  }

  /*
  addEvent(BathEvent b) {
    setState(() {
      this.bathEventsListItems.add(
        new BathEventsListItem(event: b)
      );
    });
  }
  */

  addEvent() {
    //print('ololo');
    setState(() {
      bathEventsListItems.add(
        new BathEventsListItem(
          event: new BathEvent(id: 214, title: 'Da reeal ShEAT!')
        )
      );
    });
    //print(bathEventsListItems.length);
  }

  @override
  Widget build(BuildContext context) {
    if (loadedResources == null) {
      return new Center(
        child: new CircularProgressIndicator()
      );
    } else {
      return new Block(
        children: bathEventsListItems.reversed.toList()
      );
    }
  }
}

/*
 *return new Center(
   child: new Card(
     child: new Center(
       child: new Text('Seems like resouces loaded ${jsonResources.length}')
     )
   )
 );
 */
