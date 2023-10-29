import 'package:flutter/material.dart';
import 'package:movies_development/API/api_manager.dart';
import 'package:movies_development/model/SearchResponse.dart';
import 'package:movies_development/movies/movies_items.dart';

import '../model/MovieResponse.dart';

class MoviesContainer extends StatelessWidget {
// MovieResponse movie;
  String movieName;

  MoviesContainer({required this.movieName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResponse?>(
        future: ApiManager.searchMovies(movieName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          if (snapshot.data?.success == false) {
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ""),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          List<Result> movieList = snapshot.data?.results ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return MoviesItem(result: movieList[index]);
            },
            itemCount: movieList.length,
          );
        });
    // return FutureBuilder<MoviesResponse?>(
    //   // future: ApiManager.searchMovies(query),
    //   //   builder: builder);
  }
}
