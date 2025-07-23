import 'package:cinemapedia/config/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class CustomBottonNavigation extends StatelessWidget {
  const CustomBottonNavigation({super.key});

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/');
        break;
      case 2:
        context.go('/favorites');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: getCurrentIndex(context),
      elevation: 0,
      onTap: (value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.label_outline_rounded), label: 'Categorias'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined), label: 'Favoritos'),
      ],
    );
  }
}
