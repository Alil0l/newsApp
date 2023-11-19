import 'package:flutter/material.dart';

import '../Widgets/category.dart';
import '../Widgets/newscardset_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: const CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CategorySet()),
              NewsCardSetBuilder(
                category: 'general',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
