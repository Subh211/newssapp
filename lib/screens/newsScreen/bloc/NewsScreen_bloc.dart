import 'dart:convert';

import 'package:demo_app/screens/newsScreen/bloc/NewsScreen_event.dart';
import 'package:demo_app/screens/newsScreen/bloc/NewsScreen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class NewsscreenBloc extends Bloc<NewsscreenEvent,NewsscreenState> {
  List<dynamic> _articles = [];

  NewsscreenBloc() : super(NewsInitial()) {
    on<FetchnewsEvent>(_onFetchNews);
    on<SearchnewsEvent>(_onSearchNews);
  }

  Future<void> _onFetchNews(FetchnewsEvent event , Emitter<NewsscreenState> emit) async {
    emit(NewsLoading());
    try {
      final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2024-05-27&sortBy=publishedAt&apiKey=d12ca6cce1f248a591012a9e0df1db45'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('$data');
        if (data['status'] == 'ok') {
          _articles = data['articles'];
          emit(NewsLoaded(articles: _articles));
        }
      }
  } catch (error) {
          emit(NewsError(message: "Failed to load news $error"));
    }
  }

  Future<void> _onSearchNews(SearchnewsEvent event, Emitter<NewsscreenState> emit) async {
      final SearchTerm = event.searchTerm.toLowerCase();
      final filteredArticles = await _articles.where((article) {
        final title = article['title']?.toLowerCase() ?? '';
        return title.contains(SearchTerm);
      }).toList();
      emit(NewsLoaded(articles: filteredArticles));
  }
}




//https://github.com/Richa0305/firebase_signin