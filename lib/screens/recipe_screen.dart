import 'package:flutter/material.dart';

import '../models/recipe.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeScreen({super.key, required this.recipe});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: AnimatedSwitcher(
              duration: Duration(seconds: 3),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0, end: 1).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border_outlined,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (widget.recipe.imageUrl != "")
              Hero(
                tag: widget.recipe.id,
                child: Image.network(
                  widget.recipe.imageUrl,
                  fit: BoxFit.cover,
                ),
              )
            else
              Image.asset('assets/images/default_image.jpeg'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 250,
              child: ListView.builder(
                // shrinkWrap: true,
                itemBuilder: ((_, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.recipe.ingredients[index]),
                    ),
                  );
                }),
                itemCount: widget.recipe.ingredients.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: ((_, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(widget.recipe.steps[index]),
                  );
                }),
                itemCount: widget.recipe.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
