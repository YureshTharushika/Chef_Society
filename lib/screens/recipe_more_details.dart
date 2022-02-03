

import 'package:chefsociety/models/recipe_comment.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/shared/shared_widgets.dart';
import 'package:chefsociety/widgets/commentbox.dart';
import 'package:chefsociety/widgets/comments_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';


class RecipeMoreDetails extends StatefulWidget {
  
  final String title;
  final String category;
  final String ingredients;
  final String directions;
  final String displayname;
  final String recipepicurl;
  final String documentid;
 
  const RecipeMoreDetails({ 
    Key? key,
    required this.title,
    required this.category,
    required this.ingredients,
    required this.directions,
    required this.displayname,
    required this.recipepicurl,
    required this.documentid,  
  }) : super(key: key);

  @override
  _RecipeMoreDetailsState createState() => _RecipeMoreDetailsState();
}

class _RecipeMoreDetailsState extends State<RecipeMoreDetails> {
  
 

   

  

  
  
  @override
  Widget build(BuildContext context) {

    

    return BackgroundImageWidget(
      image: NetworkImage(widget.recipepicurl), 
      child: Scaffold(
        
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: buildAppBar(),
          ),


        body: Container(
          child: Column(
            
            children: [
              
              const SizedBox(height: 10,),
              Expanded(
                child: DefaultTabController(
                length: 3,
                initialIndex: 0, 
                child: Column(
                  children: [
                    
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black.withOpacity(0.3),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),

                      tabs: [
                      Tab(
                        text: 'Ingredients'.toUpperCase(),
                      ),
                      Tab(
                        text: 'Instructions'.toUpperCase(),
                      ),
                      Tab(
                        text: 'Comments'.toUpperCase(),
                      ),
                    ],
                    ),
                    Divider(color: Colors.black.withOpacity(0.3),),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildIngredients(),
                          _buildInstructions(),
                          _buildComments(),
                        ],
                        ),
                        ),
                  ],
                ),
                ),
                ),
            ],
          ),
        ),
      ),
    ); 
  }



Widget buildAppBar(){

      return AppBar(
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: NetworkImage(widget.recipepicurl),fit: BoxFit.cover),
                
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: SafeArea(

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,),
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                      ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2,color: Colors.white,),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12,bottom: 8,top: 8),
                          child: Text(
                            'By ${widget.displayname}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ),
                      ),

                  ],

                  ),

                  ),
            ),
          ],
          
        ),
      );
}

Widget _buildIngredients(){

    List<String> myIngredients = widget.ingredients.split(",");
    

  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 20,),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
            
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_right_rounded),
                    Text(myIngredients[index]),
                  ],
                ),
              ),
            );
          },

          separatorBuilder: (BuildContext context, int index){
            return Divider(
              color: Colors.black.withOpacity(0.3),
            );
          }, 
          itemCount: myIngredients.length)
      ],
    ),

  );
}



Widget _buildInstructions(){

  return SingleChildScrollView(
    child: Column(
      
      children: [
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Text('Cooking Instructions:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey,
              ),
              ),
              SizedBox(height: 10,),
              Text('${widget.directions.split('.').join('\n\n')}'),
            ],
          ),
        ),
        
      ],
    ),

  );
}


Widget _buildComments(){

  final CollectionReference recipeCommentsCollection = FirebaseFirestore.instance.collection('recipes').doc(widget.documentid).collection('comments');

  
  

  return GestureDetector(

        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
      
      
                child: Column(
                    children: <Widget>[
                      Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                        child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10,),
                          
                                        Container(
                    
                                          padding: const EdgeInsets.all(10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(width: 1,color: Colors.grey,),
                                          ),
                    
                                            child: CommentsList(documentId: widget.documentid,),
                                              
                                                  ),
                    
                                  ],
                                ),
                              ),
                            ),
                          ),
              
                        CommentBox(recipeid: widget.documentid,),
                    ],
              ),
        ),
      );
}






Widget _buildCommentBox(){

 

  return Container(
    
    decoration: BoxDecoration(
      border: Border.all(width: 1.0,color: Colors.black),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
    margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
    height: 50.0,
    
    child: Row(
      children: <Widget>[
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.comment),
          iconSize: 25.0,
          color: Colors.grey,
          ),
          const Expanded(
            child: TextField(
              
            
              
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a comment...',
              ),
            ),
            ),
          IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.send),
          iconSize: 25.0,
          color: Colors.grey,
          ),
      ],
    ),


  );

}



}