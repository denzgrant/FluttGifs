import 'package:glass_kit/glass_kit.dart';
import 'package:flutt_gifs/constants/colors.dart';
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlassContainer.clearGlass(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          color: Colors.pinkAccent,
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.40),
                              Colors.white.withOpacity(0.10)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderGradient: LinearGradient(
                            colors: [
                              randomColors().withOpacity(.4),
                              randomColors().withOpacity(.1),
                              randomColors().withOpacity(0.05),
                              randomColors().withOpacity(0.6)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            stops: [0.0, 0.39, 0.40, 1.0],
                          ),
                          blur: 50,
                          borderWidth: 5,
                          elevation: 1.0,
                          shadowColor: randomColors().withOpacity(.9),
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(1.0),
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
            return Transform.scale(
              scale: 0.5,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
