import 'package:chefsociety/models/recipe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  double _height = 170.0;
  double _weight = 75.0;
  double _result = 0;
  String _condition = 'Select Data';



  @override
  Widget build(BuildContext context) {
    

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
          'BMI Calculator',
           style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: "Roboto",
                          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Column(
                children: [
                      Container(

                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      elevation: 10,
                                      

                                      child: Column(
                                            children: [
                                              SizedBox(height: 30.0,),
                                              Container(
                                                width: double.infinity,
                                                child: Column(
                                                  children: [
                                                    
                                                    SizedBox(height: 20.0,),
                                                    RichText(text: TextSpan(
                                                    
                                                    children:[
                                                      const WidgetSpan(
                                                            child: Icon(FontAwesomeIcons.rulerVertical,
                                                            color: Colors.orange,),
                                                            ),
                                                            const TextSpan(text:"Height (cm) : ",
                                                                style: TextStyle(
                                                                  color: Colors.orange,
                                                                  fontSize: 20.0,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                                ),
                                                            TextSpan(
                                                              text:_height.toStringAsFixed(2),
                                                              style: const TextStyle(
                                                                color: Colors.orange,
                                                                fontSize: 20.0,
                                                                fontWeight: FontWeight.bold
                                                              ),
                                                      )
                                                    ]
                                                    ),
                                                    ),
                                                    
                                                    Slider(value: _height,
                                                        min: 50,
                                                        max: 250,
                                                        onChanged: (height)
                                                    {
                                                      setState(() {
                                                        _height = height;
                                                      });
                                                    },
                                                    divisions: 250,
                                                    label: "$_height",
                                                      activeColor: Colors.teal,
                                                      inactiveColor: Color(0xff3B233B),
                                                    ),

                                                    SizedBox(height: 20.0,),
                                                    

                                                    RichText(text: TextSpan(
                                                        
                                                        children:[
                                                          const WidgetSpan(
                                                            child: Icon(FontAwesomeIcons.weight,
                                                            color: Colors.orange,),
                                                            ),
                                                          
                                                          const TextSpan(text:" Weight (kg) : ",
                                                              style: TextStyle(
                                                                color: Colors.orange,
                                                                fontSize: 20.0,
                                                                fontWeight: FontWeight.bold,),
                                                                ),
                                                          
                                                          TextSpan(
                                                            text: _weight.toStringAsFixed(2),
                                                            style: const TextStyle(
                                                              color: Colors.orange,
                                                              fontSize: 20.0,
                                                              fontWeight: FontWeight.bold
                                                            ),
                                                          )
                                                        ]
                                                    ),
                                                    ),
                                                    Slider(value: _weight,
                                                      min: 5,
                                                      max: 300,
                                                      onChanged: (weight)
                                                      {
                                                        setState(() {
                                                          _weight = weight;
                                                        });
                                                      },
                                                      divisions: 250,
                                                      label: "$_weight",
                                                      activeColor: Colors.teal,
                                                      inactiveColor: Color(0xff3B233B),
                                                    ),
                                                    SizedBox(height: 15.0,),
                                                    
                                                    
                                                    SizedBox(height: 5.0,),
                                                    

                                                    
                                              
                                                    
                                                  
                                                    



                                                  ],
                                                ),
                                              )
                                            ],
                                          ),

                            ),
                        ),
                        SizedBox(height: 10.0,),
                        Divider(),
              ElevatedButton(
                                    
                                    child: const Text(
                                      "Calculate", 
                                      style: TextStyle(
                                        color: Colors.white, 
                                        fontSize: 28,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      
                                      elevation: 10,
                                      padding: const EdgeInsets.all(10),
                                      primary: Colors.teal,
                                      shape: const StadiumBorder(),
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


                ],
          ),
        ),
      ),
    );
  } //Main Widget Ends Here
 



void calculateBMI() {
    double height = (_height) / 100;
    double weight =(_weight);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    setState(() {
      _result = result;
    });

  }
  
  String value() {
    if(_result != 0) 
    {
      return _result.toStringAsFixed(2);
    }
    else
    {
      return "";
    }
  }

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










