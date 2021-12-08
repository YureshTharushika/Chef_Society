import 'package:chefsociety/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  
  final Recipe recipe;
  
  const RecipeTile({
     Key? key,
     required this.recipe,
   }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.cyan,
            backgroundImage: NetworkImage(recipe.photourl),
            
          ),
          title: Text(recipe.title),
          subtitle: Text('By ${recipe.displayname}'),
        ),
      ),
      
    );
  }
} 