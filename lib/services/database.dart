




import 'dart:io';

import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/models/recipe_comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService{

  

  final CollectionReference? recipeCommentsCollection;

  DatabaseService({this.recipeCommentsCollection});


// collection reference

final CollectionReference recipeCollection = FirebaseFirestore.instance.collection('recipes');





//add new recipe

Future addNewRecipe(String title, String category ,String ingredients , String directions , String userid, String displayname, String photourl, String recipepicurl) async{

  try {
    return await recipeCollection.doc().set({
      'title': title,
      'category': category,
      'ingredients': ingredients,
      'directions': directions,
      'userid': userid,
      'displayname': displayname,
      'photourl': photourl,
      'recipepicurl': recipepicurl,
    });
  } on Exception catch (e) {
    print(e.toString());
  }

}

//add new comment to a recipe

Future addNewComment(String recipeid,String userid,String displayname,String photourl,String commentdetails)async{

    try{

      return await recipeCollection.doc(recipeid).collection("comments").doc().set({
      'userid': userid,
      'displayname': displayname,
      'photourl': photourl,
      'commentdetails': commentdetails,
      'postedtime': DateTime.now(),
      
      });

    }on Exception catch (e) {
        print(e.toString());
      }

}


//recipe list from snapshot

List<Recipe> _recipeListFromSnapshot(QuerySnapshot snapshot){

    return snapshot.docs.map((doc){

            return Recipe(
              title: doc.get('title') ?? '',
              category: doc.get('category') ?? '',
              ingredients: doc.get('ingredients') ?? '',
              directions: doc.get('directions') ?? '',
              userid: doc.get('userid') ?? '',
              displayname: doc.get('displayname') ?? '',
              photourl: doc.get('photourl') ?? '',
              recipepicurl: doc.get('recipepicurl') ?? '',
              documentid: doc.id,
            );
    }).toList();

}


List<RecipeComment> _recipeCommentsListFromSnapshot(QuerySnapshot snapshot){

        return snapshot.docs.map((doc){
            return RecipeComment(
              userid: doc.get('userid') ?? '',
              displayname: doc.get('displayname') ?? '',
              photourl: doc.get('photourl') ?? '',
              commentdetails: doc.get('commentdetails') ?? '',
              postedtime: doc.get('postedtime') ?? DateTime.now(),
              documentid: doc.id,
            );

        }).toList();

}





// recipe stream
Stream<List<Recipe>> get recipes {

  return recipeCollection.snapshots().map(_recipeListFromSnapshot);
}


// recipe comments stream

Stream<List<RecipeComment>> get recipeComments{

  return recipeCommentsCollection!.snapshots().map(_recipeCommentsListFromSnapshot);
}


}






//photo upload task


class FirebaseApi{

  static UploadTask? uploadFile(String destination , File file){

    try {
      final reference = FirebaseStorage.instance.ref(destination);
      
      return reference.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }

  }
}