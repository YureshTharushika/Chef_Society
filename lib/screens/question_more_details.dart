import 'package:chefsociety/widgets/answerbox.dart';
import 'package:chefsociety/widgets/answers_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;


class QuestionMoreDetails extends StatefulWidget {

  final String title;
  final String question;
  final String tags;
  
  final String displayname;
  final String photourl;
  final DateTime uploadtime;
  final String documentid;



  const QuestionMoreDetails({ 
    Key? key,
      required this.title,
      required this.question,
      required this.tags,
      required this.displayname,
      required this.photourl,
      required this.uploadtime,
      required this.documentid
  
   }) : super(key: key);

  @override
  _QuestionMoreDetailsState createState() => _QuestionMoreDetailsState();
}

class _QuestionMoreDetailsState extends State<QuestionMoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(

        child: Column(
          children: [
            Expanded(
              
                child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
              child: Column(
          
                children: [
                      Container(

                          //height: 100,
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: Color(0xFFB7B7B7).withOpacity(.36),
                              ),
                              ],
                            ),
                        child: Column(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(widget.title,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                            const SizedBox(height: 4.0,),
                            Row(
                                      children: [
                                        Text("Asked ${timeago.format(DateTime.now().subtract(DateTime.now().difference(widget.uploadtime)), locale: 'en_short')} ago",
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
                            const SizedBox(height: 4.0,),
                            Text("By ${widget.displayname}"),
                          
                          
                      

                                ],
                            ),
                        ),
                      const SizedBox(height: 10.0,),
                      Container(

                            
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 30,
                              color: Color(0xFFB7B7B7).withOpacity(.36),
                                ),
                                ],
                              ),
                          child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(widget.question),
                              
                                  ],
                              ),
                              ),
                      const SizedBox(height: 10.0,),

                      Container(

                            
                            width: double.infinity,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 30,
                              color: Color(0xFFB7B7B7).withOpacity(.36),
                                ),
                                ],
                              ),
                          child: Column(

                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                              const Text("Answers"),
                              const SizedBox(height: 10.0,),
                              _buildAnswers(),
                              
                              
                                  ],
                                ),
                          ),
            
            ],
            ),
          ),
                ),
                
              
                AnswerBox(questionid: widget.documentid,),
          ],
        ),
      ),
      
    );
  }



  Widget _buildAnswers(){

  final CollectionReference questionAnswersCollection = FirebaseFirestore.instance.collection('questions').doc(widget.documentid).collection('answers');

  
  

  return Container(
      
              
                
                      padding: const EdgeInsets.all(1),
                        child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10,),
                          
                                        Container(
                    
                                          padding: const EdgeInsets.all(2),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(width: 1,color: Colors.grey,),
                                          ),
                    
                                            child: AnswersList(documentId: widget.documentid,),
                                              
                                                  ),
                    
                                  ],
                                ),
                              
                            
                      
                
        );
      
}
}