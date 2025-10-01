import 'package:cinemapedia/config/database/database.dart';
import 'package:cinemapedia/config/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/config/domain/entities/movie.dart';
import 'package:drift/drift.dart' as drift;

class DriftLocalDatasource extends LocalStorageDatasource {
  final AppDatabase database;

  DriftLocalDatasource([AppDatabase? databaseToUse])
      : database = databaseToUse ?? db;
  @override
  Future<bool> isFavoriteMovie(int movieId) async {
    //Construir el query
    final query = database.select(database.favoriteMovies)
      ..where((table) => table.movieid.equals(movieId));

    //Ejecutar el query
    final favoriteMovie = await query.getSingleOrNull();

    //Retornar el resultado
    return favoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadFavoriteMovies(
      {int limit = 10, int offset = 0}) async {
    //Query
    final query = database.select(database.favoriteMovies)
      ..limit(limit, offset: offset);

    //Ejecturar el query
    final favoriteMoviesRows = await query.get();
    final movies = favoriteMoviesRows
        .map(
          (row) => Movie(
              adult: false,
              backdropPath: row.backdropPath,
              genreIds: const [],
              id: row.movieid,
              originalLanguage: '',
              originalTitle: row.originalTitle,
              overview: '',
              popularity: 0,
              posterPath: row.posterPath,
              releaseDate: DateTime.now(),
              title: row.title,
              video: false,
              //voteAverage
              voteAverage: row.voteAvarege,
              voteCount: 0),
        )
        .toList();

    return movies;
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavorite = await isFavoriteMovie(movie.id);

    if (isFavorite) {
      final deleteQuery = database.delete(database.favoriteMovies)
        ..where(
          (tabla) => tabla.movieid.equals(movie.id),
        );

      await deleteQuery.go();
      return;
    }

    await database
        .into(database.favoriteMovies)
        .insert(FavoriteMoviesCompanion.insert(
          movieid: movie.id,
          backdropPath: movie.backdropPath,
          originalTitle: movie.originalTitle,
          posterPath: movie.posterPath,
          title: movie.title,
          voteAvarege: drift.Value(movie.voteAverage),
        ));
  }
}
