import 'package:equatable/equatable.dart';

abstract class NewsscreenEvent extends Equatable{
  const NewsscreenEvent();
  @override
  List<Object?> get props => [];
}

class FetchnewsEvent extends NewsscreenEvent{}



class SearchnewsEvent extends NewsscreenEvent{
  final String searchTerm;

  SearchnewsEvent({
    required this.searchTerm
});

  @override
  List<Object?> get props => [searchTerm];
}