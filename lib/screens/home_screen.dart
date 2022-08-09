import 'package:flutter/material.dart';

import 'package:curso_flutter_peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Películas en cines'),
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
              CardSwiper(),

              // Slider de películas
              MovieSlider(),

            ],
          ),
        )
    );
  }
}