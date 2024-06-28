import 'package:equatable/equatable.dart';

abstract class NewsscreenState extends Equatable {
  const NewsscreenState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsscreenState{}

class NewsLoading extends NewsscreenState{}

class NewsLoaded extends NewsscreenState{
  final List<dynamic> articles;

  NewsLoaded({required this.articles});

  @override
  List<Object?> get props => [articles];
}

class NewsError extends NewsscreenState{
  final String message;

  NewsError({
    required this.message
});

  @override
  List<Object?> get props => [message];
}