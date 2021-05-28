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
  // bool isLoading = false;

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
              return Container(
                color: Colors.black12,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<TrendingGifsModel>(
                  future: _trendingGifsModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (context, index) {
                            var gifs = snapshot.data.data[index];
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.accents[Random()
                                              .nextInt(Colors.accents.length)]
                                          .withOpacity(0.5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          gifs.url,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Transform.scale(
                        scale: 0.2,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
