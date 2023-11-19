import 'package:flutter/material.dart';
import '../Widgets/newscardset_builder.dart';

class CategoryViews extends StatelessWidget {
  const CategoryViews({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 24),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
          },
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              NewsCardSetBuilder(
                category: category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
