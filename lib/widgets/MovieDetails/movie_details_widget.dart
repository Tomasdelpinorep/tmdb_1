import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/movie_details_response/movie_details_response.dart';
import 'package:http/http.dart' as http;

Future<MovieDetailsResponse> fetchMovieDetails() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/movie_id?api_key=fba6287e1b5585e45727ead4703af755'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MovieDetailsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movie list.');
  }
}

class MovieDetailstWidget extends StatefulWidget {
  const MovieDetailstWidget({super.key, required this.movieId});
  final int movieId;

  @override
  State<MovieDetailstWidget> createState() => _PeopleDetailsWidgetState();
}

class _PeopleDetailsWidgetState extends State<MovieDetailstWidget> {
  late Future<MovieDetailsResponse> futureMovieDetails;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    futureMovieDetails = fetchMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetailsResponse>(
      future: futureMovieDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _loading = false;
          return MovieDetailsItem(
              movieId: snapshot.data!.results, loading: _loading);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return Skeletonizer(
          enabled: true,
          child: ,
        );
      },
    );
  }
}
