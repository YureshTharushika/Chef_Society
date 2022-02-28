




import 'dart:io';

import 'package:chefsociety/models/question.dart';
import 'package:chefsociety/models/question_answer.dart';
import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/models/recipe_comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService{

  

  final CollectionReference? recipeCommentsCollection;
  final CollectionReference? questionAnswersCollection;

  DatabaseService({
    this.recipeCommentsCollection,
    this.questionAnswersCollection});


// collection reference

final CollectionReference recipeCollection = FirebaseFirestore.instance.collection('recipes');

final CollectionReference questionCollection = FirebaseFirestore.instance.collection('questions');





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

//add new question

Future addNewQuestion(String title, String question ,String tags , String userid, String displayname, String photourl) async{

  try {
    return await questionCollection.doc().set({
      'title': title,
      'question': question,
      'tags': tags,
      'userid': userid,
      'displayname': displayname,
      'photourl': photourl,
      'uploadtime': DateTime.now(),

      
    });
  } on Exception catch (e) {
    print(e.toString());
  }

}


//add new answer to a question

Future addNewAnswer(String questionid,String userid,String displayname,String photourl,String answerdetails)async{

    try{

      return await questionCollection.doc(questionid).collection("answers").doc().set({
      'userid': userid,
      'displayname': displayname,
      'photourl': photourl,
      'answerdetails': answerdetails,
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

//recipe comment list from snapshot


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


//question list from snapshot

List<Question> _questionListFromSnapshot(QuerySnapshot snapshot){

    return snapshot.docs.map((doc){

            return Question(
              title: doc.get('title') ?? '',
              question: doc.get('question') ?? '',
              tags: doc.get('tags') ?? '',
              userid: doc.get('userid') ?? '',
              displayname: doc.get('displayname') ?? '',
              photourl: doc.get('photourl') ?? '',
              uploadtime: doc.get('uploadtime').toDate() ?? '',
              documentid: doc.id,
            );
    }).toList();

}

//question answer list from snapshot


List<QuestionAnswer> _questionAnswersListFromSnapshot(QuerySnapshot snapshot){

        return snapshot.docs.map((doc){
            return QuestionAnswer(
              userid: doc.get('userid') ?? '',
              displayname: doc.get('displayname') ?? '',
              photourl: doc.get('photourl') ?? '',
              answerdetails: doc.get('answerdetails') ?? '',
              postedtime: doc.get('postedtime').toDate() ?? DateTime.now(),
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



// question stream
Stream<List<Question>> get questions {

  return questionCollection.snapshots().map(_questionListFromSnapshot);
}


// question answers stream

Stream<List<QuestionAnswer>> get questionAnswers{

  return questionAnswersCollection!.snapshots().map(_questionAnswersListFromSnapshot);
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