import 'package:cinemapedia/presentation/providers/providers.dart';
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
    final myMovies = favoriteMovies.values.toList(); //Opcion 3 - parte 1

    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        // final movie = favoriteMovies.values.toList()[index]; //Opcion 2
        final movie = myMovies[index]; //Opcion 3 - parte 2 (mas eficiente)
        return ListTile(
          title: Text('${movie.title}'),
        );
      },
      itemCount: favoriteMovies.keys.length,
    ));
  }
}
