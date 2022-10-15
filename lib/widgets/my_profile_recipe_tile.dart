import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/screens/recipe_more_details.dart';
import 'package:chefsociety/services/database.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';


class MyRecipeTile extends StatelessWidget {

  final Recipe recipe;
  const MyRecipeTile({
    Key? key,
    required this.recipe,
  
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(

            key: Key(recipe.documentid),

            endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    
                    SlidableAction(
                      onPressed: delete,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),

            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              
            child: InkWell(

              onTap: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  RecipeMoreDetails(title: recipe.title, category: recipe.category, ingredients: recipe.ingredients, directions: recipe.directions, displayname: recipe.displayname, recipepicurl: recipe.recipepicurl, documentid: recipe.documentid))
                              );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(0),
                child: Material(
                  elevation: 5,
                  
                  child: Container(
                    child: Column(
                      children: [
                        Text(recipe.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal,
                          ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ), 
    );
  }


void delete(BuildContext context) {

    DatabaseService().deleteDocument("recipes", recipe.documentid);

}

}





