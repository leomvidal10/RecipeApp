import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;
  final int recipeId;

  const RecipeDetailsScreen({
    super.key,
    required this.recipe,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Receita'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Hero(
                  tag: 'recipe-$recipeId',
                  child: Material(
                    child: Image.asset(recipe.thumbnailUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        recipe.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.schedule,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Text(
                                    recipe.cookTime,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Text(
                                    '${recipe.rating}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Ingredientes:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: recipe.ingredients.map((ingredient) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '- $ingredient',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          );
                        }).toList(),
                      ), // Espaçamento entre os ingredientes e as instruções
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Ingredientes:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: recipe.instructions.map((ingredient) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '- $ingredient',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          );
                        }).toList(),
                      ), //
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
