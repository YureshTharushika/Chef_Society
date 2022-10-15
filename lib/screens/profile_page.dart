import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/screens/recipe_more_details.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/widgets/my_profile_recipe_tile.dart';
import 'package:chefsociety/widgets/my_recipes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: buildAppBar(),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
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
                          text: 'My Recipes'.toUpperCase(),
                        ),
                        Tab(
                          text: 'Favourites'.toUpperCase(),
                        ),
                        Tab(
                          text: 'Following'.toUpperCase(),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildMyRecipecs(),
                          _buildMyFavouritesRecipes(),
                          _buildMyFollowing(),
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

  Widget buildAppBar() {
    return AppBar(
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1513151233558-d860c5398176?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Text(
                        user.displayName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 8, top: 8),
                      child: Text(
                        'Email: ${user.email}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyRecipecs() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(20),
      ),
      child: StreamProvider<List<Recipe>>.value(
        initialData: [],
        value: DatabaseService(searchKey: user.uid).myRecipesQuery,
        child: Builder(builder: (BuildContext newContext) {
          final recipes = Provider.of<List<Recipe>>(newContext);

          return ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: recipes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 350,
                  height: 250,
                  margin: EdgeInsets.all(5),
                  //padding: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:
                                    NetworkImage(recipes[index].recipepicurl),
                                fit: BoxFit.cover),
                          ),
                          child: Center(
                            child: Text(
                              recipes[index].title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipeMoreDetails(
                                      title: recipes[index].title,
                                      category: recipes[index].category,
                                      ingredients: recipes[index].ingredients,
                                      directions: recipes[index].directions,
                                      displayname: recipes[index].displayname,
                                      recipepicurl: recipes[index].recipepicurl,
                                      documentid: recipes[index].documentid)));
                        }),
                  ),
                );
              });
        }),
      ),
    );

    // CustomScrollView(
    //   slivers: [
    //     const SliverToBoxAdapter(
    //       child: SizedBox(
    //         height: 10,
    //       ),
    //     ),
    //     StreamProvider<List<Recipe>>.value(
    //       initialData: [],
    //       value: DatabaseService(searchKey: user.uid).myRecipesQuery,
    //       child: MyRecipes(),
    //     ),
    //   ],
    // );
  }

  Widget _buildMyFavouritesRecipes() {
    return Container();
  }

  Widget _buildMyFollowing() {
    return Container();
  }

  Widget myRecipes() {
    return Builder(builder: (BuildContext newContext) {
      final recipes = Provider.of<List<Recipe>>(context);

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return MyRecipeTile(recipe: recipes[index]);
          },
          childCount: recipes.length,
        ),
      );
    });
  }
}
