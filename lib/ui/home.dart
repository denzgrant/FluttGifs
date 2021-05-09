import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutt_gifs/constants/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        GiphyColors.giphyGreen,
                        GiphyColors.giphyBlue,
                      ],
                      stops: [
                        0.4,
                        0.7
                      ]),
                ),
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: SearchBar(),
                ),
              ),
            ),
            // pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 10,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Row(children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      child: ,
                    )
                  ),
                ),
              ]),
            ]),
          ),
        ],
      ),
    );
  }
}
