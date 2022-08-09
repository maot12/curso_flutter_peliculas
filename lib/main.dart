import 'package:flutter/material.dart';

import 'package:curso_flutter_peliculas/screens/screens.dart';

void main() => runApp(AppPeliculas());


class AppPeliculas extends StatelessWidget {

  const AppPeliculas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home':    ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
              color: Colors.indigo
          )
      ),
    );
  }
}