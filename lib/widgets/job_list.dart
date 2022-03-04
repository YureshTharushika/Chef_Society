import 'package:chefsociety/models/job.dart';
import 'package:chefsociety/screens/job_more_details.dart';
import 'package:chefsociety/shared/constants.dart';
import 'package:chefsociety/widgets/categorries.dart';

import 'package:chefsociety/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class JobList extends StatefulWidget {
  const JobList({ Key? key }) : super(key: key);

  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  @override
  Widget build(BuildContext context) {

    final jobs = Provider.of<List<Job>>(context);
    return Container(
                          decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/background/chefbg13.jpg"),
                              fit: BoxFit.cover),
                              ),
                      child: Column(
                                children: <Widget>[
                                    // Padding(
                                    //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                                    //     child: Text("Jobs",
                                    //             style: Theme.of(context).textTheme.headline3!.copyWith(
                                    //             color: Colors.blueGrey, fontWeight: FontWeight.bold),
                                    //               ),
                                    //             ),
                                    Categories(),
                                    Expanded(
                                          child: 
                                            Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
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
                                                              ),
                                                        ),
                                                  ],
                                      ),
                              );
  }
}