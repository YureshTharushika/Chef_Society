
import 'package:chefsociety/screens/add_new_job_page.dart';
import 'package:chefsociety/screens/add_new_question_page.dart';
import 'package:chefsociety/screens/add_new_recipe.dart';
import 'package:chefsociety/screens/header_drawer_page.dart';
import 'package:chefsociety/screens/jobs_page.dart';
import 'package:chefsociety/screens/q_and_a_page.dart';
import 'package:chefsociety/screens/recipes_page.dart';


import 'package:chefsociety/shared/shared_widgets.dart';
import 'package:chefsociety/widgets/drawer_list.dart';

import 'package:chefsociety/widgets/search_delegates/job_search_delegate.dart';
import 'package:chefsociety/widgets/search_delegates/q_and_a_search_delegate.dart';
import 'package:chefsociety/widgets/search_delegates/recipe_search_delegate.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class LoggedInPage extends StatefulWidget {
  const LoggedInPage({ Key? key }) : super(key: key);

  @override
  State<LoggedInPage> createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {

  int index = 1;
  String mainTitle = 'Recipes';
  String appBarColor = 'Orange';
  Color iconColor1 = Colors.white;
  Color iconColor2 = Colors.black;
  Color iconColor3 = Colors.white;

  final screens = [
        QandAPage(),
        RecipesPage(),
        JobsPage(),

  ];


  @override
  Widget build(BuildContext context) {


    
    final user = FirebaseAuth.instance.currentUser!;
    const urlImage = 'https://images.pexels.com/photos/3964662/pexels-photo-3964662.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
    final items = <Widget>[
      Icon(Icons.comment, size: 30,color: iconColor1,),
      Icon(Icons.home, size: 30,color: iconColor2,),
      Icon(Icons.person, size: 30,color: iconColor3,),
    ];

    return BackgroundImageWidget(
      image: const NetworkImage(urlImage),
      child: Scaffold(

          extendBody: true,

          
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(mainTitle),
            flexibleSpace: Container(
                          decoration:  BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Colors.teal, 
                                  Colors.teal.shade200
                                  ]
                                  ),
                              ),
                            ),
            
            
            
            
            // gradient: LinearGradient(
            //             begin: Alignment.bottomLeft,
            //             end: Alignment.topRight,
            //             colors: [
                          
            //               Colors.white,
            //               Colors.teal
            //               //Color(0xFF2ECC71)
            //             ],
            //             ),
                        
            
            
            actions: [
             IconButton(
                
                icon: const Icon(Icons.search),
                
                onPressed: (){

                  if(index==0){
                    showSearch(
                    context: context, 
                    delegate: QandASearchDelegate(),
                    );
                  }

                  if(index==1){
                    showSearch(
                    context: context, 
                    delegate: RecipeSearchDelegate(),
                    );
                  }

                  if(index==2){
                    showSearch(
                    context: context, 
                    delegate: JobSearchDelegate(),
                    );
                  }
                            },
                ),
            ],
          ),

          


          body: screens[index],

          drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    HeaderDrawer(),
                    DrawerList(),
                  ],
                ),
              ),
              ),
          ),
          

          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: (){
               if(index==0){

                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddNewQuestionPage())
                              );
               }else if(index==1){
                 
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddNewRecipe())
                              );
               }else if(index==2){
                 
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddNewJobPage())
                              );
               }
                        },
                                                    ),

          bottomNavigationBar: 
          
          
          CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: Colors.teal.shade400,
            //buttonBackgroundColor: Colors.white,

            // flexibleSpace: Container(
            //               decoration:  BoxDecoration(
            //               gradient: LinearGradient(
            //                 begin: Alignment.center,
            //                 end: Alignment.bottomCenter,
            //                     colors: <Color>[
            //                       Colors.teal, 
            //                       Colors.teal.shade200
            //                       ]
            //                       ),
            //                   ),
            //                 ),
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            index: index,
            items: items,
            onTap: (index) => setState(() { 
              this.index = index;
              if(index==0){
                mainTitle = 'Q & A';
                iconColor1 = Colors.black;
                iconColor2 = Colors.white;
                iconColor3 = Colors.white;
              }else if(index==1){
                mainTitle = 'Recipes';
                iconColor2 = Colors.black;
                iconColor1 = Colors.white;
                iconColor3 = Colors.white;
              }else if(index==2){
                mainTitle = 'Jobs';
                iconColor3 = Colors.black;
                iconColor2 = Colors.white;
                iconColor1 = Colors.white;
              }
              }),
              ),
                                                    
          
          
        ),
      );
        
      
    
  }


}



