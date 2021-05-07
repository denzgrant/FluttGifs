import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "FluttGifs",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Text(
            "hello",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          // child: ListView.builder(
          //   itemBuilder: (ctx, idx) {
          //     return Image.network(
          //         'https://giphy.com/gifs/dog-roll-over-N0rxQTLWCPEHK');
          //   },
          // ),
        ));
  }
}
