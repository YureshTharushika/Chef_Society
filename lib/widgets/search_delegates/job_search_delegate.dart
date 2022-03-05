import 'package:chefsociety/models/job.dart';
import 'package:chefsociety/screens/job_more_details.dart';

import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/shared/constants.dart';
import 'package:chefsociety/widgets/item_card.dart';
import 'package:chefsociety/widgets/job_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobSearchDelegate extends SearchDelegate{

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
    return Container(

      child: StreamProvider<List<Job>>.value(
                  
                          initialData: [],
                          value: DatabaseService(searchKey: query).jobsQuery,
          
                          child: Builder(
          
                              builder: (BuildContext newContext){

                                final jobs = Provider.of<List<Job>>(newContext);
                                    return Container(
                                      
                                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin,vertical: 10),
                                      child: GridView.builder(
                                          itemCount: jobs.length,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: kDefaultPaddin,
                                            crossAxisSpacing: kDefaultPaddin,
                                            childAspectRatio: 0.75,
                                                      ),
                                          itemBuilder: (context, index) => ItemCard(
                                          
                                          title:jobs[index].title,
                                          jobpicurl: jobs[index].jobpicurl,
                                          country: jobs[index].country,

                                          press: () => Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) => JobMoreDetails(
                                                        title: jobs[index].title,
                                                        city: jobs[index].city,
                                                        country: jobs[index].country,
                                                        description: jobs[index].description,
                                                        salary: jobs[index].salary,
                                                        contact: jobs[index].contact,
                                                        displayname: jobs[index].displayname,
                                                        photourl: jobs[index].photourl,
                                                        jobpicurl: jobs[index].jobpicurl,
                                                                  ),
                                                              ),
                                                            ),
                                                              ),
                                                          ),
                                                          );
                                                          }
                                ),
                            ),
                
                            );
     
   
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }




}








