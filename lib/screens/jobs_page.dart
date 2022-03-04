import 'package:chefsociety/models/job.dart';
import 'package:chefsociety/services/database.dart';


import 'package:chefsociety/widgets/job_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return StreamProvider<List<Job>>.value(
            initialData: const [],
            value: DatabaseService().jobs,
            child: Stack(
              
                  children:  [
                      JobList(),
                    
                        ],
                  ),
    );
  }

 



}




