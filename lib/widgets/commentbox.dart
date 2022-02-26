

import 'package:chefsociety/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CommentBox extends StatefulWidget {

  final String recipeid;

  const CommentBox({ Key? key,
  
  required this.recipeid,  
   }) : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {



String comment = '';
final TextEditingController _controller = TextEditingController();

final user = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {

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
        
       const Icon(Icons.comment,
          size: 25,
          color: Colors.grey,
          ),

           Expanded(
            child: TextField(
              
             onChanged: (val){
                  setState(() => comment = val);
                },
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type a comment...',
              ),
             
            ),
            ),
          IconButton(
          onPressed: (){
            print(comment);
            DatabaseService().addNewComment(widget.recipeid, user.uid, user.displayName!, user.photoURL!, comment);
          }, 
          icon:  const Icon(Icons.send),
          iconSize: 25.0,
          color: Colors.grey,
          ),
      ],
    ),


  );
  }

  
}