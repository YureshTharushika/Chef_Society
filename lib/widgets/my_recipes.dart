import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/widgets/my_profile_recipe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRecipes extends StatefulWidget {
  const MyRecipes({ Key? key }) : super(key: key);

  @override
  State<MyRecipes> createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> {
  @override
  Widget build(BuildContext context) {
    
    final recipes = Provider.of<List<Recipe>>(context);
    return SliverList(
      
                  
                  delegate: SliverChildBuilderDelegate((context,index){
                       
                        return MyRecipeTile(recipe: recipes[index]);
                    },
                    childCount:recipes.length,
                    ),
              
                );
  }
}