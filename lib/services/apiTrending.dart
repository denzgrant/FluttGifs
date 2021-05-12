import 'package:flutt_gifs/models/trendingInfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutt_gifs/constants/urlStrings.dart';

class TrendingInfo {
  Future<TrendingGifsModel> getTrendingGifs() async {
    var client = http.Client();
    var trendingGifsModel;

    try {
      var response = await client.get(Uri.parse(UrlStrings.trendingUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        // print(jsonMap);

        trendingGifsModel = TrendingGifsModel.fromJson(jsonMap);
        print(trendingGifsModel);
      }
    } catch (Exception) {
      return trendingGifsModel;
    }
    return trendingGifsModel;
  }
}
