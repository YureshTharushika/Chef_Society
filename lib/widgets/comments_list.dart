

import 'dart:ui';

import 'package:chefsociety/models/recipe_comment.dart';
import 'package:chefsociety/widgets/comment_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CommentsList extends StatefulWidget {


  final String? documentId;

  

  const CommentsList({ Key? key, 
  this.documentId }) : super(key: key);

  @override
  _CommentsListState createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {

  
  @override
  Widget build(BuildContext context) {

    
    
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      
      stream: FirebaseFirestore.instance.collection('recipes').doc(widget.documentId).collection('comments').snapshots(),  
      
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
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(data['photourl']),
                    ),

                    const SizedBox(width: 10,),
                    
                    Column(
                      children: [
                        Text(data['displayname'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                        Text(data['commentdetails'],
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                        ),
                        
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }
        if(snapshot.data==null){
          const Center(child: Text('No Comments Yet'));
        }
        return const Center(child: CircularProgressIndicator());
  },
  );
  }
}