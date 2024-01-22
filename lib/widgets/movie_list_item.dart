import 'package:flutter/material.dart';
import 'package:tmdb/models/movie_list_response/result.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, this.movieList});
  final List<Result>? movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList!.length,
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(8),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movieList![index].posterPath}',
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      movieList![index].originalTitle.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}



//  'https://image.tmdb.org/t/p/w500${movieList![index].posterPath}'
// Text(movieList![index].originalTitle.toString())