import 'package:flutter/material.dart';
import 'package:pinoyrecipies/screens/recipieslist_screen.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('pressed ${category.id}');
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((_) => RecipiesListScreen(
                    category: category,
                  ))),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: category.backColor,
          gradient: LinearGradient(
            colors: [
              category.backColor.withOpacity(0.65),
              category.backColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          category.title.toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
