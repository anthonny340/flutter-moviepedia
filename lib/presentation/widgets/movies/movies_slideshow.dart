import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:animate_do/animate_do.dart';

import 'package:cinemapedia/config/domain/entities/movie.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.8,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(2, 6))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black12),
                  );
                }
                return FadeIn(child: child);
              },
              //El errorBuilder es clave por si surge un error al cargar la imagen
              //si es por el formato de la imagen w500 lo que hace es que los remplaza por uno de
              //mejor calidad y en caso de que no funcione esto igual lo mandara al nuevo errorBuilder
              //y aparece el texto "Error al cargar la imagen"
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  movie.backdropPath.replaceAll('w500', 'original'),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                        child: Text("Error al cargar la imagen"));
                  },
                );
              },
            ),
          )),
    );
  }
}
