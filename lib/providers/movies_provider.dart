import 'dart:async';
import 'dart:convert';

import 'package:curso_flutter_peliculas/helpers/debouncer.dart';
import 'package:curso_flutter_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
   final String _baseUrl  = 'api.themoviedb.org';
   final String _apiKey   = '4ceb98ca7f5cadf030863a0168b50757';
   final String _language = 'es-ES';

   List<Movie> onDisplayMovies = [];
   List<Movie> popularMovies = [];

   Map<int, List<Cast>> movieCast = {};

   int _popularPage=0;

   final debounser = Debouncer(
     duration: const Duration(milliseconds: 500),
   );

   final StreamController<List<Movie>> _suggestionsStreamController = StreamController.broadcast();
   Stream<List<Movie>> get suggestionStream => _suggestionsStreamController.stream;

  MoviesProvider(){

    getOnDisplayMovies();
    getPopularMovies();

  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,{
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {

    final jsonData = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();

  }

  Future <List<Cast>> getMovieCast(int movieId) async {
    if(movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',{
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);

    return searchResponse.results;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debounser.value = '';
    debounser.onValue = (value) async {
      final results = await searchMovie(value);
      _suggestionsStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debounser.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());

  }

}