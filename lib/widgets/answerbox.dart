import 'package:chefsociety/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AnswerBox extends StatefulWidget {

  final String questionid;
  const AnswerBox({ Key? key,

    required this.questionid,
     }) : super(key: key);

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {



  String answer = '';
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
                  setState(() => answer = val);
                },
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration.collapsed(
                hintText: 'Answer this question...',
              ),
             
            ),
            ),
          IconButton(
          onPressed: (){
            print(answer);
            DatabaseService().addNewAnswer(widget.questionid, user.uid, user.displayName!, user.photoURL!, answer);
            _controller.clear();
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