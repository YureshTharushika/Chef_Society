
import 'dart:ui';

import 'package:chefsociety/models/recipe_comment.dart';
import 'package:chefsociety/widgets/comment_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;


class AnswersList extends StatefulWidget {

  final String? documentId;
  const AnswersList({ Key? key,
  this.documentId }) : super(key: key);

  @override
  _AnswersListState createState() => _AnswersListState();
}

class _AnswersListState extends State<AnswersList> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      
      stream: FirebaseFirestore.instance.collection('questions').doc(widget.documentId).collection('answers').snapshots(),  
      
      builder:  (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: docs.length,
            itemBuilder: (_, i) {
              final data = docs[i].data();
              return Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(data['photourl']),
                    ),

                    const SizedBox(width: 10,),
                    Text(data['displayname'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                    const SizedBox(width: 10,),
                    Text("Answered ${timeago.format(DateTime.now().subtract(DateTime.now().difference(data['postedtime'].toDate())), locale: 'en_short')} ago",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12.0,
                              ),
                            ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Text(data['answerdetails'],
                        
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                        ),
                    Divider(),
                  ],
                ),
              );
            },
          );
        }
        if(snapshot.data==null){
          const Center(child: Text('No Answers Yet..Be the first one to answer!'));
        }
        return const Center(child: CircularProgressIndicator());
  },
  );
  }
}