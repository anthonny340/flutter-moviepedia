import 'package:cinemapedia/config/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;

  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(''),
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(20),
        child: Image.network(movie.posterPath),
      ),
    );
  }
}
