import 'package:flutt_gifs/services/apiTrending.dart';
import 'package:flutt_gifs/models/trendingInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TrendingGifsCards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'assets/logo.png',
                  scale: 0.6,
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white, size: 30),
            ),
          ),
          //Search Bar
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 1000,
          //     color: Colors.grey,
          //     child: Text("Search Goes here"),
          //   ),
          // ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return TrendingGifsCards();
            }),
          ),
        ],
      ),
    );
  }
}
