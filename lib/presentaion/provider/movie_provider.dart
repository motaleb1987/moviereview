
import 'package:flutter/cupertino.dart';
import 'package:moviereview/data/service/api_service.dart';

import '../../domain/entities/movie.dart';

class MovieProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Movie> _trendingMovies = [];
  List<Movie> get trendingMovies => _trendingMovies;
  List<Movie> _searchResults = [];
  List<Movie> get searchResults => _searchResults;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchTrendingMovies() async {
    _isLoading = true;
    notifyListeners();
    try {
      _trendingMovies = await apiService.getTrendingMovies();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }
    _isLoading = true;
    notifyListeners();
    try {
      _searchResults = await apiService.searchMovies(query);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }

  }
  Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    _isLoading = true;
    notifyListeners();
    try {
      return await apiService.getMovieDetails(movieId);
    } catch (e) {
     throw Exception('Failed to load movie details');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}