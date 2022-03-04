import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/screens/recipe_more_details.dart';
import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  
  final Recipe recipe;
  
  const RecipeTile({
     Key? key,
     required this.recipe,
   }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        Container(
          
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          padding:const EdgeInsets.all(10),
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.teal.shade300,
              width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0,1),
              ),
            ],
            image: DecorationImage(image: NetworkImage(recipe.recipepicurl),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        Container(

          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(0.25),
          ),
        ),

        Container(

          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 25, 5, 85),
            child: Container(
              
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:  Colors.white.withOpacity(0.5)
              ),

                  child: ListTile(

                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  RecipeMoreDetails(title: recipe.title, category: recipe.category, ingredients: recipe.ingredients, directions: recipe.directions, displayname: recipe.displayname, recipepicurl: recipe.recipepicurl, documentid: recipe.documentid))
                              );
                    },
              
                leading: CircleAvatar(
                
                radius: 28,
                backgroundColor: Colors.cyan,
                backgroundImage: NetworkImage(recipe.photourl),
                                  ),
                title: Text(recipe.title,
                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16,),
                            ),
                subtitle: Text('By ${recipe.displayname}',
                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,),
                            ),
              ),
            ),
            ),
        ),
      ],
    );
  }
} 




// Below Code is Not Relavent


// Padding(
//       padding: const EdgeInsets.only(top: 8),
//       child: Card(
        
//         margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
//         child: ListTile(
//           leading: CircleAvatar(
//             radius: 25,
//             backgroundColor: Colors.cyan,
//             backgroundImage: NetworkImage(recipe.photourl),
            
//           ),
//           title: Text(recipe.title),
//           subtitle: Text('By ${recipe.displayname}'),
//         ),
//       ),
      
//     );