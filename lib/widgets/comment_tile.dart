import 'package:chefsociety/models/recipe_comment.dart';
import 'package:flutter/material.dart';


class CommentTile extends StatelessWidget {


  final RecipeComment recipeComment;
  const CommentTile({ Key? key,
  required this.recipeComment,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          
          Text(recipeComment.commentdetails),
        ],
      ),
      
    );
  }
}