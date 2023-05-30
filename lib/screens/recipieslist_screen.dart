import 'package:flutter/material.dart';
import 'package:pinoyrecipies/components/recipeentry_item.dart';
import 'package:pinoyrecipies/data/recipe_list.dart';

import '../models/category.dart';

class RecipiesListScreen extends StatelessWidget {
  final Category category;

  const RecipiesListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var filteredRecipies =
        RECIPELIST.where((element) => element.catId == category.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
        backgroundColor: category.backColor,
      ),
      body: ListView.builder(
        itemBuilder: ((_, index) =>
            RecipeEntryItem(recipe: filteredRecipies[index])),
        itemCount: filteredRecipies.length,
      ),
    );
  }
}
