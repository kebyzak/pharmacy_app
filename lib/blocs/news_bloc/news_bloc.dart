import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/models/news.dart';
import 'package:pharmacy_app/services/news_service.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService newsService;

  NewsBloc({required this.newsService}) : super(const NewsState.loading()) {
    on<_FetchPostsEvent>((event, emit) async {
      emit(const NewsState.loading());
      try {
        final List<News> posts = await newsService.getNews();
        emit(NewsState.success(posts: posts));
      } catch (e) {
        emit(const NewsState.error());
      }
    });
  }
}
