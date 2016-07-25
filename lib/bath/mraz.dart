import "package:flutter/material.dart";
import "dart:math" show Random;

typedef void GuestListChangedCallback(String guest, bool isPresent);

class MrazListItem extends StatelessWidget{
  MrazListItem({ String guest, this.isPresent, this.onGuestListChanged, this.isNull })
  : guest = guest, super(key: new ObjectKey(guest));

  final String guest;
  final bool isPresent;
  final bool isNull;
  final GuestListChangedCallback onGuestListChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle textStyle = themeData.textTheme.body2;//body2.copyWith(color: themeData.primaryColor);

    return new Row(
      children: <Widget>[
        new Checkbox(
          value: isPresent,
          onChanged: isNull ? null : (bool value){onGuestListChanged(guest, value);}
        ),
        new Flexible(child: new Text(guest, style: textStyle))
    ]);
  }
}

enum MrazDialogAction {
  retry,
  ok
}

class MrazDialogue extends StatelessWidget{
  MrazDialogue({this.mraz});

  final String mraz;

  @override
  Widget build(BuildContext context) {
    return new Dialog(
      title: new Text("Today's Winner is:"),
      content: new Text("${mraz.toUpperCase()}"),
      actions: <Widget>[
        new FlatButton(
          child: new Text('RETRY'),
          onPressed: () { Navigator.pop(context, MrazDialogAction.retry); }
        ),
        new FlatButton(
          child: new Text('OK'),
          onPressed: () { Navigator.pop(context, MrazDialogAction.ok); }
        )
      ]
    );
  }
}

class TabMraz extends StatefulWidget{
  TabMraz({ Key key, this.guests }) : super(key: key);

  final List<String> guests;

  @override
  TabMrazState createState() => new TabMrazState();
}

class TabMrazState extends State<TabMraz> {
  Set<String> _presentGuests = new Set<String>();
  String mraz;
  bool mrazSelected = false;

  void _handleGuestState(String guest, bool value) {
    setState(() {
      if (value)
        _presentGuests.add(guest);
      else
        _presentGuests.remove(guest);
    });
  }

  List<Widget> _generateBlock(bool mrazSelected) {
    List<Widget> widgetList;

    if (!mrazSelected){
      widgetList = config.guests.map((String guest) {
        return new MrazListItem(
          guest: guest,
          isPresent: _presentGuests.contains(guest),
          onGuestListChanged: _handleGuestState,
          isNull: false
        );
      }).toList();

      widgetList.insert(0,
        new RaisedButton(
          onPressed: (){_selectMraz();},
          child: new Text("Select Mraz' from ${_presentGuests.length} guests")
        )
      );
    } else {
      widgetList = config.guests.map((String guest) {
        return new MrazListItem(
          guest: guest,
          isPresent: _presentGuests.contains(guest),
          onGuestListChanged: _handleGuestState,
          isNull: true
        );
      }).toList();

      widgetList.insert(0,
        new RaisedButton(
          onPressed: null,
          child: new Text("$mraz, ti Mraz'!")
        )
      );
    }

    return widgetList;
  }

  void _selectMraz(){
      if (_presentGuests.length == 0){
        return;
      }

      var random = new Random();
      mraz = _presentGuests.toList()[random.nextInt(_presentGuests.length)];
      print(mraz);

      showDialog(
        context: context,
        child: new MrazDialogue(mraz: mraz)
      );

      setState(() {
        _presentGuests.clear();
        _presentGuests.add(mraz);
        mrazSelected = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Block(
      children: _generateBlock(mrazSelected)
    );
  }
}
