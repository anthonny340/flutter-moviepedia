import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:cinemapedia/config/database/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Probando insercion a BD
  // await db.into(db.favoriteMovies).insert(
  //       FavoriteMoviesCompanion.insert(
  //           movieid: 1,
  //           backdropPath: 'backdropPath.png',
  //           originalTitle: 'Indiana Jones',
  //           posterPath: 'posterPath.gif',
  //           title: 'La primera pelicula'),
  //     );
  // final deleteQuery = await db.delete(db.favoriteMovies);
  // deleteQuery.go();

  // final movies = await db.select(db.favoriteMovies).get();
  // print(movies);
  await dotenv.load(
      fileName: '.env'); //Espera a que se lean todas las variables de entorno
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
