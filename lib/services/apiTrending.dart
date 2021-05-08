import 'package:flutt_gifs/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const trendingGifsURL = 'https://api.giphy.com/v1/gifs/trending?';

var apiKey = env["APIKEY"];

class TrendingGifsModel {
  Future<dynamic> getTrendingGifs() async {
    var url = 'trendingGifsURL$apiKey&limit=25&rating=g';
    NetworkHelper networkHelper = NetworkHelper(url);

    var trendingGifsData = await networkHelper.getData();
    print(trendingGifsData);
    return trendingGifsData;
  }
}
