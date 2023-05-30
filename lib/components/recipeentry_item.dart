import 'package:flutter/material.dart';
import 'package:pinoyrecipies/models/recipe.dart';
import 'package:pinoyrecipies/screens/recipe_screen.dart';

class RecipeEntryItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeEntryItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  print(recipe.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => RecipeScreen(recipe: recipe))),
                  );
                },
                child: Hero(
                  tag: recipe.id,
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: recipe.imageUrl != ""
                          ? Image.network(
                              recipe.imageUrl,
                              fit: BoxFit.cover,
                            )
                          : Image.asset('assets/images/default_image.jpeg'),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  width: sWidth * 0.75,
                  padding: const EdgeInsets.all(8),
                  color: Colors.black45,
                  child: Text(
                    recipe.title,
                    style: Theme.of(context).textTheme.caption,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.schedule),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${recipe.minuteDuration} minute(s)',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
