import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../services/news.dart';
import 'news_card_set.dart';

class NewsCardSetBuilder extends StatefulWidget {
  const NewsCardSetBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsCardSetBuilder> createState() => _NewsCardSetBuilderState();
}

var future;

class _NewsCardSetBuilderState extends State<NewsCardSetBuilder> {
  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsCardSet(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
                child: Text('Oops There Was an Error!'));
          } else {
            return const SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.center,
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          }
        });
  }
}


//     return isLoading
//         ? const SliverToBoxAdapter(
//             child: Align(
//               alignment: Alignment.center,
//               child: Center(child: CircularProgressIndicator()),
//             ),
//           )
//         : articles.isNotEmpty
//             ? NewsCardSet(articles: articles)
//             : const SliverToBoxAdapter(child: Text('Oops There Was an Error!'));
//   }
// }
