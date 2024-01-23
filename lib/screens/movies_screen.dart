import 'package:flutter/material.dart';
import 'package:tmdb/widgets/MovieList/movie_list_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return  const MovieListWidget();
  }
}