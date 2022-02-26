import 'package:chefsociety/widgets/home_category_tiles.dart';
import 'package:chefsociety/widgets/recipe_list.dart';
import 'package:flutter/material.dart';


class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
            
            slivers: [
              // SliverAppBar(
              //   backgroundColor: Colors.white,
              //   title: const Text('Recipes',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 28.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   ),
              //   centerTitle: false,
              //   floating: true,
              //   actions: [

              //     IconButton(
              //           onPressed: (){
              //             final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
              //             provider.logOut();
              //             print('logout');
              //           }, 
              //           icon: Icon(Icons.logout_rounded),
              //           iconSize: 25.0,
              //           color: Colors.black,
              //           ),

              //         ],

              // ),


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
            );
  }
}