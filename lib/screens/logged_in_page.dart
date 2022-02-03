import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/screens/add_new_recipe.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/services/google_sign_in.dart';
import 'package:chefsociety/shared/shared_widgets.dart';
import 'package:chefsociety/widgets/home_category_tiles.dart';
import 'package:chefsociety/widgets/recipe_list.dart';
import 'package:chefsociety/widgets/recipe_tile.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoggedInPage extends StatelessWidget {
  const LoggedInPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    
    final user = FirebaseAuth.instance.currentUser!;
    const urlImage = 'https://images.unsplash.com/photo-1488477181946-6428a0291777?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';

    return BackgroundImageWidget(
      image: const NetworkImage(urlImage),
      child: StreamProvider<List<Recipe>>.value(
        
        initialData: [],

        value: DatabaseService().recipes,
        

        child: Scaffold(

          
          //backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   title: const Text('Home'),
            
          //   actions: [
          //     ElevatedButton(
                
          //       child: const Text('logout'),
          //       onPressed: (){

          //         final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
          //         provider.logOut();
          //                   },
          //       ),
          //   ],
          // ),
          body: //RecipeList()
          CustomScrollView(
            
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                title: const Text('Recipes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                centerTitle: false,
                floating: true,
                actions: [

                  IconButton(
                        onPressed: (){
                          final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                          provider.logOut();
                          print('logout');
                        }, 
                        icon: Icon(Icons.logout_rounded),
                        iconSize: 25.0,
                        color: Colors.black,
                        ),

                      ],

              ),


              SliverPadding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                sliver: SliverToBoxAdapter(
                  
                  child: Container(
                    child: const Text('Categories',
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
                sliver: SliverToBoxAdapter(
                  
                  child: Categories(),
                ),
                ),

                const SliverPadding(
                padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                
                sliver: RecipeList(),
                
                ),


                  ],
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
                                                    
          
          
        ),
      ),
        
      
    );
  }


}



