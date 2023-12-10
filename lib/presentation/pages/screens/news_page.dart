// news_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import 'package:pharmacy_app/presentation/blocs/news_bloc/news_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.read<NewsBloc>().add(const NewsEvent.fetchPosts());
    });
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: Text(S.of(context).initialState),
            ),
            loading: () => _buildLoading(context),
            error: () => Center(
              child: Text(S.of(context).errorFetchingNewsData),
            ),
            success: (news) {
              final limitedNews = news.take(10).toList();

              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemCount: limitedNews.length,
                itemBuilder: (context, index) {
                  final newsItem = limitedNews[index];
                  return Card(
                    elevation: 5,
                    color: Colors.redAccent.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsItem.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            newsItem.body,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    if (!context.mounted) return const SizedBox.shrink();

    return Center(
      child: Lottie.asset(
        'assets/loading.json',
        height: 200,
        width: 200,
        repeat: true,
      ),
    );
  }
}
