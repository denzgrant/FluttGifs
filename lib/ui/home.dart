import 'dart:math';

import 'package:flutt_gifs/services/apiTrending.dart';
import 'package:flutt_gifs/models/trendingInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<TrendingGifsModel> _trendingGifsModel;
  @override
  void initState() {
    _trendingGifsModel = TrendingInfo().getTrendingGifs();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.black,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder<TrendingGifsModel>(
                    future: _trendingGifsModel,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (context, index) {
                              var gifs = snapshot.data.data[index];
                              return Card(
                                elevation: 50.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        color: Colors.accents[Random()
                                            .nextInt(Colors.accents.length)],
                                        child: Image.network(
                                          gifs.url,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
