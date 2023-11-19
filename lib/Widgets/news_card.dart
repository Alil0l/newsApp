import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.articleModel});
  final ArticleModel articleModel;

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      Uri.parse(articleModel.url),
    )) {
      throw Exception("Could not launch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchUrl();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: articleModel.image != null
                        ? NetworkImage(articleModel.image!)
                        : const AssetImage('assets/sports.avif')
                            as ImageProvider<Object>,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Column(
                children: [
                  Text(articleModel.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        wordSpacing: 5,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      articleModel.description ??
                          "Can't Find Description for this",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
