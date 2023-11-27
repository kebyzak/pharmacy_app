part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = Initial;
  const factory NewsState.loading() = Loading;
  const factory NewsState.error() = Error;
  const factory NewsState.success({required List<News> posts}) = Success;
}
