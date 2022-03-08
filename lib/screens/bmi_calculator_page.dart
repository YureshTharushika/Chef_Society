import 'package:chefsociety/models/recipe.dart';
import 'package:chefsociety/screens/recipe_more_details.dart';
import 'package:chefsociety/services/database.dart';
import 'package:chefsociety/widgets/recipe_tile.dart';
import 'package:chefsociety/widgets/workout_plans/high_bmi.dart';
import 'package:chefsociety/widgets/workout_plans/low_bmi.dart';
import 'package:chefsociety/widgets/workout_plans/mid_bmi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({ Key? key }) : super(key: key);

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  static double _result = 0.0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
           style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontFamily: "Roboto",
                          ),
          ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body:Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bmi.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 15),
              TextField(
                controller: _heightController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height in cm',
                  icon: Icon(Icons.trending_up),
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[900],
                  )

                ),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              
              const SizedBox(height: 20),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Weight in Kg',
                  icon: Icon(Icons.line_weight),
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[900],
                  )
                ),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),

              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: Text(
                  "Calculate", 
                  style: TextStyle(
                    color: Colors.lime[50], 
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: (){
                  calculateBMI();
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    
                    builder: (context) => buildSheet(),
                  );
                },
              ),
              const SizedBox(height: 15),
              Text(
                _heightController.text.isEmpty || _weightController.text.isEmpty ? "Enter Values" : _result.toStringAsFixed(2),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colors(),
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                message(),
                style: TextStyle(
                  color: colors(),
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
                ),
              const SizedBox(height: 15),
              Text(
                advise(),
                style: TextStyle(
                  color: colors(),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
        ],
      ),
      
    );
  } //Main Widget Ends Here
 

OutlineInputBorder focusBorder(){
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.greenAccent,
          width: 3,
        )
    );
  }//focusBorder Ends Here

  OutlineInputBorder inputBorder(){
    return const OutlineInputBorder( 
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.redAccent,
          width: 3,
        )
    );
  }//inputBorder Ends Here

void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    setState(() {
      _result = result;
    });

  }//calculateBMI Ends Here

  String message() {
    if(_result == 0) 
    {
      return "";
    }
    else if(_result > 0 && _result < 16)
    {
      return "Very Severely UnderWeight";
    }
    else if(_result >= 16 && _result < 17)
    {
      return "Severely UnderWeight";
    }
    else if(_result >= 17 && _result < 18.5)
    {
      return "UnderWeight";
    }
    else if(_result >= 18.5 && _result < 25)
    {
      return "Healthy"; 
    }
    else if(_result >= 25 && _result < 30)
    {
      return "Overweight";
    }
    else if(_result >= 30 && _result < 35)
    {
      return "Obese Class I";
    }
    else if(_result >= 35 && _result < 40)
    {
      return "Obese Class II";
    }
    else if(_result >= 40)
    {
      return "Obese Class III";
    }
    else
    {
      return "null";
    }
  }//message Ends Here

  String advise() {
    if(_result == 0.00) 
    {
      return "";
    }
    else if(_result < 18.5)
    {
      return "Time to grab a bite";
    }
    else if(_result >= 18.5 && _result < 25)
    {
      return "Great Shape";
    }
    else if(_result >= 25)
    {
      return "Time for a run";
    }
    else
    {
      return "null";
    }
  }//advise Ends Here

  colors() {
    if(_result > 0 && _result < 16)
    {
      return Colors.redAccent[700];
    }
    else if(_result >= 16 && _result < 17)
    {
      return Colors.redAccent[400];
    }
    else if(_result >= 17 && _result < 18.5)
    {
      return Colors.redAccent[100];
    }
    else if(_result >= 18.5 && _result < 25)
    {
      return Colors.teal;
    }
    else if(_result >= 25 && _result < 30)
    {
      return Colors.redAccent[100];
    }
    else if(_result >= 30 && _result < 35)
    {
      return Colors.redAccent[400];
    }
    else if(_result >= 35 && _result < 40)
    {
      return Colors.red[700];
    }
    else if(_result >= 40)
    {
      return Colors.redAccent[700];
    }
  }//colors Ends Here



Widget makeDismissable({required Widget child}) => GestureDetector(

              behavior: HitTestBehavior.opaque,
              onTap: () =>Navigator.of(context).pop(),
              child: GestureDetector(onTap: (){},child: child,),

          );
//makeDismissable Ends Here

Widget buildSheet() => makeDismissable(
  child:DraggableScrollableSheet(
        
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.8,
        builder: (_,controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),

        ),
        padding: EdgeInsets.all(16),

        child: ListView(

              controller: controller,       
              children: [
                
                Text("Your BMI Index : ${_result.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: colors(),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                        ),
                  textAlign: TextAlign.center,
                      ),

                const SizedBox(height: 5),
                Text(message(),
                  style: TextStyle(
                      color: colors(),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                        ),
                  textAlign: TextAlign.center,
                      ),
                const SizedBox(height: 10),
                Text(advise(),
                  style: TextStyle(
                      color: colors(),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                        ),
                  textAlign: TextAlign.center,
                      ),
                const SizedBox(height: 10),
                Divider(height: 3,),
                Text('Suggested Recipes For You..'),

                const SizedBox(height: 5),

                recommendedRecipesList(),

                const SizedBox(height: 10),
                Divider(height: 3,),
                Text('Suggested Workout Plan For You..'),
                
                const SizedBox(height: 5),

                recommendedWorkoutPlan(),

                
              ],
            ),
            ),
        )
    );
//buildSheet Ends Here



Widget recommendedRecipesList(){
  
      return Column(
            children: [
                    if (_result < 18.5) ...[
                      Container(
                          height: 200,
                          
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            //borderRadius: BorderRadius.circular(20),
                          ),
                          
                          child: StreamProvider<List<Recipe>>.value(
                          initialData: [],
                          value: DatabaseService(category1: 'Main-Course', category2: 'Appetisers', category3: 'Dinner', category4: 'Breakfast').bmiRecommendedRecipesQuery,
          
                          child: Builder(
                            
                            builder: (BuildContext newContext){
                              
                              final recipes = Provider.of<List<Recipe>>(newContext);

                              return ListView.builder(

                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: recipes.length,
                                itemBuilder: (BuildContext context, int index) {
                                          return 
                                            
                                             Container(
                                              
                                                  width: 300,
                                                  margin: EdgeInsets.all(5),
                                                  //padding: EdgeInsets.all(10),
                                                  
                                                  decoration:  BoxDecoration(
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
                                                        image: DecorationImage(image: NetworkImage(recipes[index].recipepicurl),fit: BoxFit.cover),
                                                      ),

                                                      child: Center(
                                                        child:  Text(recipes[index].title,
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 16,
                                                                      ),
                                                                    ),
                                                      ),    
                                                    ),
                                                    onTap:(){
                                                      Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) =>  RecipeMoreDetails(title: recipes[index].title, category: recipes[index].category, ingredients: recipes[index].ingredients, directions: recipes[index].directions, displayname: recipes[index].displayname, recipepicurl: recipes[index].recipepicurl, documentid: recipes[index].documentid))
                                                                    );
                                                        }
                                                  ),
                                              ),
                                            );
                                          
                                              }
                                      );
                            }
                            ),
                            ),
                ),
                      
                    ] else if(_result >= 18.5 && _result < 25)...[
                      Container(
                          height: 200,
                          
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            //borderRadius: BorderRadius.circular(20),
                          ),
                          
                          child: StreamProvider<List<Recipe>>.value(
                          initialData: [],
                          value: DatabaseService(category1: 'Baked Goods', category2: 'Dessert', category3:'Snacks', category4: 'Lunch').bmiRecommendedRecipesQuery,
          
                          child: Builder(
                            
                            builder: (BuildContext newContext){
                              
                              final recipes = Provider.of<List<Recipe>>(newContext);

                              return ListView.builder(

                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: recipes.length,
                                itemBuilder: (BuildContext context, int index) {
                                          return 
                                            
                                             Container(
                                              
                                                  width: 300,
                                                  margin: EdgeInsets.all(5),
                                                  //padding: EdgeInsets.all(10),
                                                  
                                                  decoration:  BoxDecoration(
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
                                                        image: DecorationImage(image: NetworkImage(recipes[index].recipepicurl),fit: BoxFit.cover),
                                                      ),

                                                      child: Center(
                                                        child:  Text(recipes[index].title,
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 16,
                                                                      ),
                                                                    ),
                                                      ),    
                                                    ),
                                                    onTap:(){
                                                      Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) =>  RecipeMoreDetails(title: recipes[index].title, category: recipes[index].category, ingredients: recipes[index].ingredients, directions: recipes[index].directions, displayname: recipes[index].displayname, recipepicurl: recipes[index].recipepicurl, documentid: recipes[index].documentid))
                                                                    );
                                                        }
                                                  ),
                                              ),
                                            );
                                          
                                              }
                                      );
                            }
                            ),
                            ),
                ),
                    ] else if(_result >= 25)...[
                      Container(
                          height: 200,
                          
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            //borderRadius: BorderRadius.circular(20),
                          ),
                          
                          child: StreamProvider<List<Recipe>>.value(
                          initialData: [],
                          value: DatabaseService(category1: 'Soups', category2: 'Salads', category3: 'Side-Dishes', category4: 'Drinks').bmiRecommendedRecipesQuery,
          
                          child: Builder(
                            
                            builder: (BuildContext newContext){
                              
                              final recipes = Provider.of<List<Recipe>>(newContext);

                              return ListView.builder(

                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: recipes.length,
                                itemBuilder: (BuildContext context, int index) {
                                          return 
                                            
                                             Container(
                                              
                                                  width: 300,
                                                  margin: EdgeInsets.all(5),
                                                  //padding: EdgeInsets.all(10),
                                                  
                                                  decoration:  BoxDecoration(
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
                                                        image: DecorationImage(image: NetworkImage(recipes[index].recipepicurl),fit: BoxFit.cover),
                                                      ),

                                                      child: Center(
                                                        child:  Text(recipes[index].title,
                                                                    style: const TextStyle(
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 16,
                                                                      ),
                                                                    ),
                                                      ),    
                                                    ),
                                                    onTap:(){
                                                      Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) =>  RecipeMoreDetails(title: recipes[index].title, category: recipes[index].category, ingredients: recipes[index].ingredients, directions: recipes[index].directions, displayname: recipes[index].displayname, recipepicurl: recipes[index].recipepicurl, documentid: recipes[index].documentid))
                                                                    );
                                                        }
                                                  ),
                                              ),
                                            );
                                          
                                              }
                                      );
                            }
                            ),
                            ),
                ),
                    ],
                ],
              );
          

}


Widget recommendedWorkoutPlan(){


    return Column(

            children: [
              if (_result < 18.5) ...[

                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    //color: Colors.black,
                    height: 100,
                    child: Material(
                      elevation: 10,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  LowBmiWorkoutPlan())
                                        );
                                },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Center(child: 
                                    Text("12 Weeks Muscle Gainer",
                                    
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700,
                                    ),
                                    ),
                                    ),
                            Center(child: 
                                     Text("Beginner Workout Plan",
                                     style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700,
                                    ),
                                    ),
                                    ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ),


                ] else if(_result >= 18.5 && _result < 25)...[
                
                    Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        //color: Colors.black,
                        height: 100,
                        child: Material(
                          elevation: 10,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  MidBmiWorkoutPlan())
                                            );
                                    },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Center(child: 
                                        Text("6 Weeks General Fitness",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade700,
                                        ),
                                        ),
                                        ),
                                Center(child: 
                                        Text("Beginner Workout Plan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
                                        ),
                                        ),
                                        ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ),
                
                
                
                
                  ] else if(_result >= 25)...[

                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    //color: Colors.black,
                    height: 100,
                    child: Material(
                      elevation: 10,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  HighBmiWorkoutPlan())
                                        );
                                },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Center(child: 
                                    Text("12 Weeks Fat Burner",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700,
                                    ),
                                    ),
                                    ),
                            Center(child: 
                                     Text("Beginner Workout Plan",
                                     style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700,
                                    ),
                                    ),
                                    ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ),
                  

                ],

            ],
    );


}


}







