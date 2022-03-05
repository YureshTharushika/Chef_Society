import 'package:chefsociety/models/question.dart';
import 'package:chefsociety/screens/question_more_details.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;



class QuestionTile extends StatelessWidget {
  
  final Question question;
  
  const QuestionTile({ 
      Key? key,
      required this.question,
      }) : super(key: key);


  


  @override
  Widget build(BuildContext context) {

    List<String> tags = question.tags.split(",");
    int index = 0;
    return InkWell(
      onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  QuestionMoreDetails(title: question.title, question: question.question, tags: question.tags, displayname: question.displayname, photourl: question.photourl, uploadtime: question.uploadtime, documentid: question.documentid))
                              );
                    },
      child: Container(
    
        
    
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        padding:const EdgeInsets.all(10),
        width: double.infinity,
        height: 165,
        
        
        decoration: BoxDecoration(
              border: Border.all(
              color: Colors.teal.shade300,
              width: 4),
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0,2),
                ),
              ],
              //image: DecorationImage(image: NetworkImage(recipe.recipepicurl),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
        child: Column(
          children: [
            Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(question.photourl),
                    ),
                    const SizedBox(width: 8,),
                    Column(
                      children: [
                        Text(question.displayname),
                        Row(
                          children: [
                            Text("${timeago.format(DateTime.now().subtract(DateTime.now().difference(question.uploadtime)), locale: 'en_short')} ago",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12.0,
                                  ),
                                ),
                            Icon(
                              Icons.public,
                              color: Colors.grey[600],
                              size: 12.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      ],
                    ),
    
            const SizedBox(height: 4.0,),
            Text(question.title),
            const SizedBox(height: 4.0,),
            Container(
              
              height: 70,
              //color: Colors.black,
              child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              
              
              itemCount: tags.length,
              
              itemBuilder: (BuildContext context, index){
              
              return Container(
                
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                ),
                
                child: Text(tags[index]),
                );
            },
            
              ),
            ),
                    
                ],
        )
        
      ),
    );
  }
}