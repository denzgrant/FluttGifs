import 'package:flutter/material.dart';
import 'package:flutt_gifs/services/apiTrending.dart';

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
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Text("Trending"),
                ),
              ),
            ),
            // pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 10,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                width: 5,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  child: TextButton(
                    onPressed: () async {
                      await getTrendingGifs();
                    },
                    child: Text(
                      "Search",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
