import 'package:chefsociety/widgets/calorie_cal_categories/burger.dart';
import 'package:chefsociety/widgets/calorie_cal_categories/cake.dart';
import 'package:chefsociety/widgets/calorie_cal_categories/friedrice.dart';
import 'package:chefsociety/widgets/calorie_cal_categories/pizza.dart';
import 'package:flutter/material.dart';



class CalorieCalculatorPage extends StatelessWidget {
  const CalorieCalculatorPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

            appBar: AppBar(
              title: Text('Calorie Calculator',
                style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue[50],
                            fontFamily: "Roboto",
                          ),
                        ),
              centerTitle: true,
              backgroundColor: Colors.blueAccent,
                  ),


            body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 15),
                              /*
                              ElevatedButton.icon(
                                icon: const FaIcon(
                                  FontAwesomeIcons.birthdayCake,
                                  size: 30,
                                  //color: Colors.green,
                                ),
                                label: const Text(
                                  "Cakes",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Cake()),
                                  );
                                },
                                
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton.icon(
                                icon: const FaIcon(
                                  FontAwesomeIcons.hamburger,
                                  size: 30,
                                  //color: Colors.green,
                                ),
                                label: const Text(
                                  "Burgers",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Cake()),
                                  );
                                },
                              ),
                              */

                      InkWell(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Cake()),
                          );
                        }, // Handle your callback.
                        splashColor: Colors.brown.withOpacity(0.6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              //mainAxisSize: MainAxisSize.min,
                              alignment: Alignment.center,
                              children: [
                                Ink(
                                  height: 150,
                                  //width: 300,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/cake.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  'Cake',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.teal.shade50,
                                    fontFamily: "Roboto",
                                  ),
                                ), 
                                
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Burger()),
                          );
                        }, // Handle your callback.
                        splashColor: Colors.brown.withOpacity(0.6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              //mainAxisSize: MainAxisSize.min,
                              alignment: Alignment.center,
                              children: [
                                Ink(
                                  height: 150,
                                  //width: 300,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/burger.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  
                                ),
                                Container(
                                  height: 150,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  'Burger',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.teal.shade50,
                                    fontFamily: "Roboto",
                                  ),
                                ), 
                                
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FriedRice()),
                          );
                        },
                        //borderRadius: BorderRadius.circular(52),
                        splashColor: Colors.brown.withOpacity(0.6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              //mainAxisSize: MainAxisSize.min,
                              alignment: Alignment.center,
                              children: [
                                Ink(
                                  height: 150,
                                  //width: 300,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/friedrice.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  'Fried Rice',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.teal.shade50,
                                    fontFamily: "Roboto",
                                  ),
                                ), 
                                
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Pizza()),
                          );
                        },
                        //borderRadius: BorderRadius.circular(52),
                        splashColor: Colors.brown.withOpacity(0.6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              //mainAxisSize: MainAxisSize.min,
                              alignment: Alignment.center,
                              children: [
                                Ink(
                                  height: 150,
                                  //width: 300,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/pizza.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                Text(
                                  'Pizza',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.teal.shade50,
                                    fontFamily: "Roboto",
                                  ),
                                ), 
                                
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),


                        ],
                      ),
              ),
            ),
      
        );
  }

OutlineInputBorder focusBorder(){
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.greenAccent,
          width: 3,
        )
    );
  }

  OutlineInputBorder inputBorder(){
    return const OutlineInputBorder( 
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.redAccent,
          width: 3,
        )
    );
  }

}

