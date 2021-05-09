import 'package:flutter/material.dart';
import 'package:flutt_gifs/constants/darkLightTheme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'home.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
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
            elevation: 1.0,
            leading: Image.asset('assets/logo.png'),
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
