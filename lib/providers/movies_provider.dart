import 'dart:convert';

import 'package:curso_flutter_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
   String _baseUrl  = 'api.themoviedb.org';
   String _apiKey   = '4ceb98ca7f5cadf030863a0168b50757';
   String _language = 'es-ES';

  MoviesProvider(){
    print('MoviesProvider inicializando');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    for(int i = 0; i<nowPlayingResponse.results.length;i++){
      print(nowPlayingResponse.results[i].title);
    }
  }
}