




import 'dart:io';

import 'package:chefsociety/models/job.dart';
import 'package:chefsociety/models/question.dart';
import 'package:chefsociety/models/question_answer.dart';
import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/models/recipe_comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService{

  

  final CollectionReference? recipeCommentsCollection;
  final CollectionReference? questionAnswersCollection;
  
  final String? searchKey;
  final String? category1;
  final String? category2;
  final String? category3;
  final String? category4;

  DatabaseService({
    this.recipeCommentsCollection,
    this.questionAnswersCollection,
    
    this.searchKey,
    this.category1,
    this.category2,
    this.category3,
    this.category4,
    });


// collection reference

final CollectionReference recipeCollection = FirebaseFirestore.instance.collection('recipes');

final CollectionReference questionCollection = FirebaseFirestore.instance.collection('questions');

final CollectionReference jobCollection = FirebaseFirestore.instance.collection('jobs');




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


//add new job

Future addNewJob(String title, String country ,String city , String description , double salary, int contact, String userid, String displayname, String photourl, String jobpicurl) async{

  try {
    return await jobCollection.doc().set({
      'title': title,
      'country': country,
      'city': city,
      'description': description,
      'salary': salary,
      'contact': contact,
      'userid': userid,
      'displayname': displayname,
      'photourl': photourl,
      'jobpicurl': jobpicurl,
    });
  } on Exception catch (e) {
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


//job list from snapshot

List<Job> _jobListFromSnapshot(QuerySnapshot snapshot){

    return snapshot.docs.map((doc){

            return Job(
              title: doc.get('title') ?? '',
              country: doc.get('country') ?? '',
              city: doc.get('city') ?? '',
              description: doc.get('description') ?? '',
              salary: doc.get('salary') ?? '',
              contact: doc.get('contact') ?? '',
              userid: doc.get('userid') ?? '',
              displayname: doc.get('displayname') ?? '',
              photourl: doc.get('photourl') ?? '',
              jobpicurl: doc.get('jobpicurl') ?? '',
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


// job stream
Stream<List<Job>> get jobs {

  return jobCollection.snapshots().map(_jobListFromSnapshot);
}



// recipe search query
Stream<List<Recipe>> get recipesQuery {

  return recipeCollection.where('title', isGreaterThanOrEqualTo: searchKey!)
                        .where('title', isLessThan: searchKey! +'z')
                        .snapshots().map(_recipeListFromSnapshot);
}


// job search query
Stream<List<Job>> get jobsQuery {

  return jobCollection.where('title', isGreaterThanOrEqualTo: searchKey!)
                        .where('title', isLessThan: searchKey! +'z')
                        .snapshots().map(_jobListFromSnapshot);
}

// question search query
Stream<List<Question>> get questionsQuery {

  return questionCollection.where('title', isGreaterThanOrEqualTo: searchKey!)
                        .where('title', isLessThan: searchKey! +'z')
                        .snapshots().map(_questionListFromSnapshot);
}

// bmi recommended recipe  query
Stream<List<Recipe>> get bmiRecommendedRecipesQuery {

  return recipeCollection.where('category', isEqualTo: category1!).snapshots().map(_recipeListFromSnapshot);


}

// my profile recipe  query
Stream<List<Recipe>> get myRecipesQuery {

  return recipeCollection.where('userid', isEqualTo: searchKey!).snapshots().map(_recipeListFromSnapshot);
}




//delete document

Future deleteDocument(String collectionName, String documentId) async{

        DocumentReference documentReference = FirebaseFirestore.instance
                                              .collection(collectionName)
                                              .doc(documentId);


        return await FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
          transaction.delete(documentReference);
        
            });

}



}









// FirebaseFirestore.instance.collection('Col-Name')
//                         .where('fieldName', isGreaterThanOrEqualTo: searchKey)
//                         .where('fieldName', isLessThan: searchKey +'z')
//                         .snapshots()







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