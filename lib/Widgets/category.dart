import 'package:flutter/material.dart';
import '../Pages/Category_Views.dart';
import '../models/category_model.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryViews(category: category.categoryName);
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16, bottom: 16),
        width: 200,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(category.image),
            )),
        child: Center(
            child: Text(
          category.categoryName,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}

class CategorySet extends StatelessWidget {
  const CategorySet({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/business.avif',
      categoryName: 'Business',
    ),
    CategoryModel(
      image: 'assets/entertaiment.avif',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/health.avif',
      categoryName: 'Health',
    ),
    CategoryModel(
      image: 'assets/science.avif',
      categoryName: 'Science',
    ),
    CategoryModel(
      image: 'assets/technology.jpeg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      image: 'assets/sports.avif',
      categoryName: 'Sports',
    ),
    CategoryModel(
      image: 'assets/general.avif',
      categoryName: 'General',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Category(
              category: categories[index],
            );
          }),
    );
  }
}
