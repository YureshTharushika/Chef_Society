import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/widgets/home_category_tiles.dart';
import 'package:chefsociety/widgets/recipe_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  
  

  String searchKey = '';

  
    

  

  // @override
  // void initState(){
  //   super.initState();
  //   _controller.addListener(() => setState(() { }));
    

  // }

  @override
  Widget build(BuildContext context) {


    
    Stream<List<Recipe>> recipeDataStream = DatabaseService().recipes;
    //Stream<List<Recipe>> recipeSearchDataStream = DatabaseService(searchKey: searchKey).recipesQuery;
    
    
    

    

    return CustomScrollView(
            
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

                // SliverPadding(
                // padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                
                // sliver: StreamProvider<List<Recipe>>.value(
                //           initialData: [],
                //           value: dataStream,
          
                //           child: RecipeList(),
                //             ),
                
                //             ),

                SliverPadding(
                padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                
                sliver: StreamProvider<List<Recipe>>.value(
                          initialData: [],
                          value: recipeDataStream,
          
                          child: RecipeList(),
                            ),
                
                            ),


                  ],
            );
  }



}

















            