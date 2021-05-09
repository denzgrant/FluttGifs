import 'package:flutt_gifs/services/apiTrending.dart';
import 'package:flutter/cupertino.dart';

class GifCard extends StatefulWidget {
  const GifCard({Key key}) : super(key: key);

  @override
  _GifCardState createState() => _GifCardState();
}

class _GifCardState extends State<GifCard> {
  TrendingGifsModel trendingGifsModel = TrendingGifsModel();

  String url;
  String gifTitle;

  void updateUI(dynamic trendingGifsData) {
    setState(() {
      if (trendingGifsData == null) {
        url = '';
        gifTitle = "Unable to get weather data, check location settings";
        return;
      }
      dynamic dataUrl = trendingGifsData['data']['url'];
      url = dataUrl.toString();

      dynamic dataGifTitle = trendingGifsData['data']['title'];
      gifTitle = dataGifTitle.toString();

      print(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
