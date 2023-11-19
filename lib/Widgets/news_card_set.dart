import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'news_card.dart';

class NewsCardSet extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsCardSet({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return NewsCard(articleModel: articles[index]);
        },
      ),
    );
  }
}
