import 'package:flutter/material.dart';
import 'package:movies_development/API/movies_container.dart';
import 'package:movies_development/movies/movies_items.dart';
import 'package:movies_development/myTheme.dart';

import '../API/api_manager.dart';
import '../model/MovieResponse.dart';

class SearchMovieDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => showResults(context), icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text('Suggestions'));
    }
    return MoviesContainer(movieName: query); //FutureBuilder<MovieResponse?>(
    //     future: ApiManager.searchMovies(query),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text('Something went wrong'),
    //             ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //
    //       var movieList = snapshot.data?.results ?? [];
    //       return ListView.builder(
    //         itemBuilder: (context, index) {
    //           return MoviesItem(movies: movieList[index]);
    //         },
    //         itemCount: movieList.length,
    //       );
    //     });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text('Suggestions'));
    }
    return FutureBuilder<MovieResponse?>(
        future: ApiManager.searchMovies(query),
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

          var movieList = snapshot.data?.results ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return MoviesItem(movies: movieList[index]);
            },
            itemCount: movieList.length,
          );
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return MyTheme.lightTheme;
  }
}
