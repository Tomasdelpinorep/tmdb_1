import 'package:flutter/material.dart';
import 'package:tmdb/models/movie_list_response/result.dart';
import 'package:tmdb/screens/movie_details.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, this.movieList, required this.loading});
  final List<Result>? movieList;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList!.length,
      itemBuilder: (context, index) {
        return Card(
          surfaceTintColor: Colors.white,
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(8),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(
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
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      movieList![index].originalTitle.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 8),
                    child: SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MovieDetailsPage(),
                            )
                          );
                        },
                        child: const Text(
                          'Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
