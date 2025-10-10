import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider);

    //Formas de transformar el mapa en listas
    // final myMovies = favoriteMovies.values.toList(); //Opcion 1
    final myMoviesList = favoriteMovies.values.toList(); //Opcion 3 - parte 1

    final colorPrimary = Theme.of(context).colorScheme.primary;

    if (myMoviesList.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, size: 100, color: colorPrimary),
              const Text('No tienes películas favoritas'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        body: MoviesMasonry(
      movies: myMoviesList,
      loadNextPage: () =>
          ref.read(favoriteMoviesProvider.notifier).loadNextPage(),
    )
        /*
        ListView.builder(
      itemBuilder: (context, index) {
        // final movie = favoriteMovies.values.toList()[index]; //Opcion 2
        final movie = myMovies[index]; //Opcion 3 - parte 2 (mas eficiente)
        return ListTile(
          title: Text('${movie.title}'),
        );
        
      },
      
      itemCount: favoriteMovies.keys.length,
    )
    */
        );
  }
}
