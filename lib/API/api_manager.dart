import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/MovieResponse.dart';
import 'api_constants.dart';

class ApiManager {
  static Future<MovieResponse?> searchMovies(String query) async {
    try {
      Uri url = Uri.https(
          ApiConstatnts.baseUrl, ApiConstatnts.moviesApi, {'q': query});
      var response = await http.get(url, headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NGMwYzNjYmUxMjFlNmU1NmZkMTNlZWM1NTUzNzlhZCIsInN1YiI6IjY1Mzk5MzZlOTU1YzY1MDBjNDU1MWFhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KHa1gpTS1rvl4_n7Su_kjfacBQ2c_DLXsALp7rLrtZo",
      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print('Success');
      return MovieResponse.fromJson(json);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
