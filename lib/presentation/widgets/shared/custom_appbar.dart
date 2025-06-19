import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.movie_filter_outlined,
              color: colors.primary,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Cinemapedia',
                style: titleStyle,
              ),
            ),
            const Spacer(), //Toma todo el espacio que hay en medio de los dos widgets
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
              ),
            ));
  }
}
