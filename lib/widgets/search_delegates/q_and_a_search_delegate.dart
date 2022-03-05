import 'package:chefsociety/models/question.dart';

import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/widgets/question_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QandASearchDelegate extends SearchDelegate{

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
       
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
      );
      
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton( 
        icon: const Icon(Icons.clear),
        onPressed: (){
          if(query.isEmpty){
            close(context, null);
          }else{
            query = '';
          }
        },)
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
                padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                
                sliver: StreamProvider<List<Question>>.value(
                          initialData: [],
                          value: DatabaseService(searchKey: query).questionsQuery,
          
                          child: QuestionList(),
                            ),
                
                            ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }



}