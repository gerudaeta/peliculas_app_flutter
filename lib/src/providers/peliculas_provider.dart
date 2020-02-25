import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:peliculas_app/src/models/pelicula_model.dart';


class PeliculasProvider {
  String _apiKey   = '3108f0d2043e42c616fb39556422c803';
  String _url      = 'api.themoviedb.org';
  String _lenguage = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'lenguage': _lenguage
    });
    final resp = await http.get(url);
    final decodedDate = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedDate['results']);

    return peliculas.items;
  }


}