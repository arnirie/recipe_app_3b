class Recipe {
  final int id;
  final int catId;
  final String title;
  final List<String> steps;
  final List<String> ingredients;
  final int minuteDuration;
  final String imageUrl;

  Recipe({
    required this.id,
    required this.catId,
    required this.title,
    required this.steps,
    required this.ingredients,
    this.minuteDuration = 0,
    this.imageUrl = '',
  });
}
