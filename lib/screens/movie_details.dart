import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MovieDetailsWidget(),
      ),
    );
  }
}