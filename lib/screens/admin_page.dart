import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/widgets/my_recipes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body:Container(

          child: Column(
            
            children: [
              
              const SizedBox(height: 10,),
              Expanded(
                child: DefaultTabController(
                length: 3,
                initialIndex: 0, 
                child: Column(
                  children: [
                    
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black.withOpacity(0.3),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),

                      tabs: [
                      Tab(
                        text: 'All Recipes'.toUpperCase(),
                      ),
                      Tab(
                        text: 'Favourites'.toUpperCase(),
                      ),
                      Tab(
                        text: 'Following'.toUpperCase(),
                      ),
                    ],
                    ),
                    Divider(color: Colors.black.withOpacity(0.3),),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildAllRecipecs(),
                          //_buildMyFavouritesRecipes(),
                          //_buildMyFollowing(),

                          
                          
                        ],
                        ),
                        ),
                  ],
                ),
                ),
                ),
            ],
          ),
        ),
      
    );
  }


Widget _buildAllRecipecs(){

  return CustomScrollView(
    slivers: [
      
        const SliverToBoxAdapter(

          child: SizedBox(height: 20,),
        ),
        

        
         StreamProvider<List<Recipe>>.value(
                          initialData: [],
                          value: DatabaseService().recipes,
          
                          child: MyRecipes(),
                            ),
       
        
      
    ],

  );
}



}