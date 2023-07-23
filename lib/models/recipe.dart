class Recipe {
  final String title;
  final double rating;
  final String cookTime;
  final String thumbnailUrl;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.title,
    required this.rating,
    required this.cookTime,
    required this.thumbnailUrl,
    required this.ingredients,
    required this.instructions,
  });
}