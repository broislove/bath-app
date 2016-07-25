import 'package:flutter/material.dart';

import 'tabs.dart';
import 'dialogues.dart';
import 'events.dart';
import 'mraz.dart';


class BathHome extends StatefulWidget {
  BathHome({ Key key }) : super(key: key);

  @override
  BathHomeState createState() => new BathHomeState();
}

class BathHomeState extends State<BathHome> {
  final Key _homeKey = new ValueKey<String>("BathApp Home"); //???
  Tab selectedTab;
  //Widget bathEventsList;
/*
  @override
  void initState() {
    super.initState();
    //selectedTab = tabs[0];
  }

  void handleTabSelection(Tab tab) {
    setState(() {
      selectedTab = tab;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return /*new TabBarSelection<Tab>(
      values: tabs,
      onChanged: handleTabSelection,
      child: */new Scaffold(
        key: _homeKey,
        appBar: new AppBar(
            title: new Text('BathApp!'),
            actions: <Widget>[new IconButton(
                icon: new Icon(Icons.info),
                tooltip: 'About',
                onPressed: () {
                   showAboutDialog(
                     context: context,
                     applicationName: kAppName,
                     applicationVersion: kAppVer,
                     applicationIcon: kAppImage,
                     applicationLegalese: kAppLicense,
                     children: <Widget>[ new AboutW() ]
                   );
                }
            )
          ]/*,
            bottom: new TabBar<Tab>(
              labels: new Map<Tab, TabLabel>.fromIterable(tabs, value: (Tab tab) {
                return new TabLabel(text: tab.label);
              })
            )*/
        ),
        body: new TabMraz(guests: guestList)
        /*new TabBarView<Tab>(
          children: tabs.map((Tab tab) {
            return tab.viewWidget;
          }).toList()
        )*/,
        floatingActionButton: /*!selectedTab.fabDefined ? null : new FloatingActionButton(
          tooltip: selectedTab.toolTip,
          child: selectedTab.fabIcon,
          onPressed: selectedTab.fabAction        )*/
          new FloatingActionButton(
            tooltip: "Select Mraz'!",
            child: new Icon(Icons.add),
            onPressed: null//selectedTab.fabAction
          )
    );
  }
}

/*
 *           // null // () {
             // need to handle push result
             //Navigator.push(context, new MaterialPageRoute<DialogActions>(
             //  builder: (BuildContext context) => new NewBathEventDialog()
             //));
             //}
 */
