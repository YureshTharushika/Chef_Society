import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/widgets/home_category_tiles.dart';
import 'package:chefsociety/widgets/recipe_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Recipe>>.value(
          initialData: [],
          value: DatabaseService().recipes,
          child: CustomScrollView(
            
            slivers: [
           
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                sliver: SliverToBoxAdapter(
                  
                  child: Container(
                    child: const Text('Categories',
                    style:  TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    ),
                    ),
                  ),
                ),
                ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                sliver: SliverToBoxAdapter(
                  
                  child: Categories(),
                ),
                ),

                const SliverPadding(
                padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                
                sliver: RecipeList(),
                
                ),


                  ],
            ),
    );
  }
}




