import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/config/domain/datasources/movies_datasource.dart';

import 'package:cinemapedia/config/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      //BaseOptions permite establecer opciones por defecto que se aplicarán a todas
      //las peticiones que hagas con esa instancia de la clase Dio, que en este caso se llama dio.
      baseUrl:
          'https://api.themoviedb.org/3', // URL base para todas las peticiones
      queryParameters: {
        //Parámetros por defecto para todas las peticiones
        'api_key':
            Environment.ThemovieDbKey, // Incluye la API key automáticamente
        'language': 'es-ES',
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    response.data;
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where(
          (moviedb) => moviedb.posterPath != 'no-poster',
        )
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
