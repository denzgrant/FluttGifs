import 'dart:math';

import 'package:flutt_gifs/models/trendingInfo.dart';
import 'package:flutt_gifs/services/apiTrending.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingGifsCards extends StatefulWidget {
  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<TrendingGifsCards> {
  Future<TrendingGifsModel> _trendingGifsModel;
  // bool isLoading = false;

  @override
  void initState() {
    _trendingGifsModel = TrendingInfo().getTrendingGifs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          height: MediaQuery.of(context).size.height / 2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.accents[
                                    Random().nextInt(Colors.accents.length)]
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
  }
}
