import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/widgets/recipe_tile.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RecipeList extends StatefulWidget {
  const RecipeList({ Key? key }) : super(key: key);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {

    final recipes = Provider.of<List<Recipe>>(context);

    return ListView.builder(
      
      itemCount: recipes.length,
      itemBuilder: (context, index){
        return RecipeTile(recipe: recipes[index]);
      },
      );
  }
}