import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_development/movies/movies_details_screen.dart';

import '../model/MovieResponse.dart';
import '../myTheme.dart';

class MoviesItem extends StatelessWidget {
  MovieResponse movies;

  MoviesItem({required this.movies});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(MoviesDetailsScreen.routeName, arguments: movies),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: CachedNetworkImage(
                imageUrl: movies.urlToImage ?? "",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              movies.author ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(movies.title ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 10,
            ),
            Text(
              movies.publishedAt ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.greyColor),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
