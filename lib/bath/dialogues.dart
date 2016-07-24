import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'events.dart';

final String kAppName = 'BathApp!';
final String kAppVer = '0.1 Prewiew';
final String kAppLicense = '© 2016 Bro';
final kAppImage = new AssetImage('assets/flutter_logo.png');

class LinkTextSpan extends TextSpan {
  LinkTextSpan({ TextStyle style, String url, String text }) : super(
    style: style,
    text: text ?? url,
    recognizer: new TapGestureRecognizer()..onTap = () {
      UrlLauncher.launch(url);
    }
  );
}

class AboutW extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);
    TextStyle textStyle = themeData.textTheme.body2;
    TextStyle linkStyle = themeData.textTheme.body2.copyWith(color: themeData.accentColor);

    return new Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: new RichText(
        text: new TextSpan(
          children: <TextSpan>[
            new TextSpan(
              style: textStyle,
              text:
              "BathApp is a simple Andriod app to keep Tuesday Bath's stats in the cloud."
              "\n\nWritten on Dart using Flutter framework."
              "\nTo see the source code, please visit the "
            ),
            new LinkTextSpan(
              style: linkStyle,
              url: 'https://github.com/broislove/bath-app',
              text: 'BathApp! github repo'
            ),
            new TextSpan(
              style: textStyle,
              text: "."
            )
          ]
        )
      )
    );
  }
}

enum DialogActions {
  cancel,
  discard,
  save,
}

class BathEventDetails extends StatelessWidget{
  BathEventDetails(this.event);
  BathEvent event;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(event.id.toString())
      ),
      body: new Center(
        child: new Card(
          child: new Center(
            child: new Text(event.id.toString())
          )
        )
      )
    );
  }
}

class NewBathEventDialog extends StatefulWidget{
  @override
  NewBathEventDialogState createState() => new NewBathEventDialogState();
}

class NewBathEventDialogState extends State<NewBathEventDialog>{
  bool _saveNeeded = true;

  void handleDismissButton(BuildContext context) {
    if (!_saveNeeded) {
      Navigator.pop(context, null);
      return;
    }

    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(
      color: theme.textTheme.caption.color
    );

    showDialog(
      context: context,
      child: new Dialog(
        content: new Text(
          'Discard new event?',
          style: dialogTextStyle
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('CANCEL'),
            onPressed: () { Navigator.pop(context, DialogActions.cancel); }
          ),
          new FlatButton(
            child: new Text('DISCARD'),
            onPressed: () {
              Navigator.of(context)
                ..pop(DialogActions.discard) // pop the cancel/discard dialog
                ..pop(); // pop this route
            }
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
      //key: _scaffoldKey,
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.clear),
          onPressed: () { handleDismissButton(context); }
        ),
        title: new Text('New Event'),
        actions: <Widget> [
          new FlatButton(
            child: new Text('SAVE', style: theme.textTheme.body1.copyWith(color: Colors.white)),
            onPressed: () { Navigator.pop(context, DialogActions.save); }
          )
        ]
      ),
      body: new Center(
        child: new Card(
          child: new Center(
            child: new Text('New Event')
          )
        )
      )
    );
  }
}
