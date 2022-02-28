import 'package:chefsociety/models/question.dart';
import 'package:chefsociety/widgets/question_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class QuestionList extends StatefulWidget {
  const QuestionList({ Key? key }) : super(key: key);

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {

    final questions = Provider.of<List<Question>>(context);

    return SliverList(
                delegate: SliverChildBuilderDelegate((context,index){
                       
                        return QuestionTile(question: questions[index]);
                    },
                    childCount:questions.length,
                    ),
    );
  }
}