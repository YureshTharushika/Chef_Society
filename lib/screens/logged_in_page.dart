import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/screens/add_new_recipe.dart';
import 'package:chefsociety/screens/header_drawer_page.dart';
import 'package:chefsociety/screens/jobs_page.dart';
import 'package:chefsociety/screens/q_and_a_page.dart';
import 'package:chefsociety/screens/recipes_page.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/services/google_sign_in.dart';
import 'package:chefsociety/shared/shared_widgets.dart';
import 'package:chefsociety/widgets/drawer_list.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoggedInPage extends StatefulWidget {
  const LoggedInPage({ Key? key }) : super(key: key);

  @override
  State<LoggedInPage> createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {

  int index = 1;

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
      Icon(Icons.comment, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return BackgroundImageWidget(
      image: const NetworkImage(urlImage),
      child: StreamProvider<List<Recipe>>.value(
        
        initialData: [],

        value: DatabaseService().recipes,
        

        child: Scaffold(

          extendBody: true,

          
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Home'),
            
            // actions: [
            //   ElevatedButton(
                
            //     child: const Text('logout'),
            //     onPressed: (){

            //       final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
            //       provider.logOut();
            //                 },
            //     ),
            // ],
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
               Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddNewRecipe())
                              );
                        },
                                                    ),

          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index),
              ),
                                                    
          
          
        ),
      ),
        
      
    );
  }


}



