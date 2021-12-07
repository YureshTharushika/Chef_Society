

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  


// collection reference

final CollectionReference recipeCollection = FirebaseFirestore.instance.collection('recipes');


Future addNewRecipe(String title, String category ,String ingredients , String directions , String userid, String displayname) async{

  try {
    return await recipeCollection.doc().set({
      'title': title,
      'category': category,
      'ingredients': ingredients,
      'directions': directions,
      'userid' : userid,
      'displayname': displayname,
    });
  } on Exception catch (e) {
    print(e.toString());
  }

}

}