import 'package:flutter/material.dart';

import 'package:curso_flutter_peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon( Icons.search_outlined ),
              onPressed: () {}
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              // Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),

              // Slider de películas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares!',
                onNextPage: ()=> moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        )
    );
  }
}