import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutt_gifs/constants/darkLightTheme.dart';

import 'home.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIOverlays(
  //     [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DarkLightTheme();
  }
}

bool _light = true;

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({Key key}) : super(key: key);

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _light ? lightTheme : darkTheme,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,
            actions: [
              Icon(_light ? Icons.lightbulb : Icons.lightbulb_outline),
              Switch(
                  value: _light,
                  onChanged: (state) {
                    setState(() {
                      _light = state;
                    });
                  })
            ],
          ),
          body: Home(),
        ));
  }
}
