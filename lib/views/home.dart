import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipeapp/views/recipe-details-screen.dart';
import 'package:recipeapp/views/widgets/recipe_card.dart';
import 'dart:convert';

import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Receitas')
            ]),
      ),
      body: FutureBuilder(
        future: lerDadosDoArquivo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Recipe> recipes = snapshot.data as List<Recipe>;
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RecipeDetailsScreen(
                            recipeId: index,
                            recipe: recipes[index],
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'recipe-$index',
                      child: Material(
                        child: RecipeCard(
                          title: recipes[index].title,
                          cookTime: recipes[index].cookTime,
                          rating: recipes[index].rating.toString(),
                          thumbnailUrl: recipes[index].thumbnailUrl,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Não foi possível carregar as receitas.'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Recipe>> lerDadosDoArquivo() async {
    try {
      String jsonString = await rootBundle.loadString('assets/recipes.json');
      List<dynamic> data = json.decode(jsonString);
      List<Recipe> recipes = data.map((recipe) {
        return Recipe(
          title: recipe['title'],
          rating: recipe['rating'],
          cookTime: recipe['cookTime'],
          thumbnailUrl: recipe['thumbnailUrl'],
          ingredients: List<String>.from(recipe['ingredients']),
          instructions: List<String>.from(recipe['instructions']),
        );
      }).toList();
      return recipes;
    } catch (e) {
      print('Erro ao ler o arquivo JSON: $e');
      return [];
    }
  }
}
