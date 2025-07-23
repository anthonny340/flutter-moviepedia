import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/home_views/home_view.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => const HomeView(),
            routes: [
              GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';
                  return MovieScreen(movieId: movieId);
                },
              )
            ]),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        )
      ])

  //Rutas padre/hijo
  // GoRoute(
  //     path: '/',
  //     name: HomeScreen.name,
  //     builder: (context, state) => const HomeScreen(
  //           childView: FavoritesView(),
  //         ),
  //     //Estas son las rutas hijas de la ruta principal
  //     routes: [
  //       GoRoute(
  //           //El primer slash de la ruta hija no es necesario porque lo proporciona
  //           //el path de la ruta padre
  //           path: 'movie/:id',
  //           name: MovieScreen.name,
  //           builder: (context, state) {
  //             final movieId = state.pathParameters['id'] ?? 'no-id';
  //             return MovieScreen(movieId: movieId);
  //           }),
  //     ]),
]);
