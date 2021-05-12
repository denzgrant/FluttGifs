import 'package:flutter_dotenv/flutter_dotenv.dart';

var apiKey = env["APIKEY"];
const trendingGifsURL = 'https://api.giphy.com/v1/gifs/trending';

class UrlStrings {
  static String trendingUrl =
      '$trendingGifsURL?api_key=$apiKey&limit=20&rating=g';
}
