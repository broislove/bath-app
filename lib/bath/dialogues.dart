import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

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
