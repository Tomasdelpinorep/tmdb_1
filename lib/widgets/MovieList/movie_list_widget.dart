import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/movie_list_response/movie_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/widgets/MovieList/movie_list_item.dart';

Future<MovieListResponse> fetchMovieList() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=fba6287e1b5585e45727ead4703af755'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MovieListResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movie list.');
  }
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  late Future<MovieListResponse> futureMovieList;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    futureMovieList = fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieListResponse>(
      future: futureMovieList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _loading = false;
          return MovieListItem(
              movieList: snapshot.data!.results, loading: _loading);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return Skeletonizer(
          enabled: true,
          child: ListView.builder(
            itemCount: 20,
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
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text('')
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
