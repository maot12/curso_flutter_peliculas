import 'package:curso_flutter_peliculas/providers/movies_provider.dart';
import 'package:flutter/material.dart';

import 'package:curso_flutter_peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => MoviesProvider(), lazy: false,
          )
        ],
      child: const AppPeliculas(),
    );
  }
}



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