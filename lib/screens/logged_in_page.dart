import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/screens/add_new_recipe.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/services/google_sign_in.dart';
import 'package:chefsociety/shared/shared_widgets.dart';
import 'package:chefsociety/widgets/recipe_list.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoggedInPage extends StatelessWidget {
  const LoggedInPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;
    final urlImage = 'https://images.unsplash.com/photo-1552010099-5dc86fcfaa38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80';

    return BackgroundImageWidget(
      image: NetworkImage(urlImage),
      child: StreamProvider<List<Recipe>>.value(
        initialData: [],

        value: DatabaseService().recipes,

        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Home'),
            
            actions: [
              ElevatedButton(
                
                child: const Text('logout'),
                onPressed: (){

                  final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                  provider.logOut();
                            },
                ),
            ],
          ),
          body: RecipeList(),

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



