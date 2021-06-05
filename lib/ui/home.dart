import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TrendingGifsCards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white24,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.black45,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset("assets/logo.png"),
              ),
              // title: SearchBar(),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return TrendingGifsCards();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
