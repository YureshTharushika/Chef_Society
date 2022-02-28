import 'package:chefsociety/models/question.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/widgets/question_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class QandAPage extends StatelessWidget {
  const QandAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Question>>.value(
              
              value: DatabaseService().questions,
              initialData: [],
              child: CustomScrollView(

                slivers: [
                      SliverPadding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      sliver: SliverToBoxAdapter(
                        
                        child: Container(
                          child: const Text('Questions',
                          style:  TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                      ),

                
                SliverPadding(
                    padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                    
                    sliver: QuestionList(),
                    
                    ),
                  ],
        ),
    );
  }
}