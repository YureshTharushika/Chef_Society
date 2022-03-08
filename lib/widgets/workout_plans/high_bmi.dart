import 'package:flutter/material.dart';


class HighBmiWorkoutPlan extends StatelessWidget {
  const HighBmiWorkoutPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    
    

    TableRow _line1 =  const TableRow(

      children: [

      

        Padding(
          padding: EdgeInsets.all(5),
          child: Text("Exercise",
                    style: TextStyle(
                      fontSize:18,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
          ),
        Padding(
        padding: EdgeInsets.all(5),
        child: Text("Sets",
                    style: TextStyle(
                      fontSize:18,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
        ),
        Padding(
        padding: EdgeInsets.all(5),
        child: Text("Reps",
                    style: TextStyle(
                      fontSize:18,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
        ),  
              ],
        );   
 


    return  Scaffold(


      
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            
            expandedHeight: 200,
            pinned: true,
            elevation: 10,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              
              background: Image(
                              image: AssetImage("assets/bmi/high_bmi_appbar_bg.jpg"),
                              fit: BoxFit.cover,
                              ),
              title: Text("12 Week Fat Burner Workout"),
              
            ),
          ),


          const SliverToBoxAdapter(
              child: SizedBox(height: 10,),
            ),

          SliverToBoxAdapter(
            child: Container(


              padding: const EdgeInsets.all(10),
              child: Material(
              
              elevation: 15,
              color: Colors.teal.shade200,
              borderRadius: BorderRadius.circular(20),

              child: Container(
                padding: const EdgeInsets.all(5),
              child: Column(
                children: [

                  const Text("Plan for the week",
                          style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  const SizedBox(height: 5,),
                  Table(
                    children: [
                      weekdayRow("Monday","Upper A"),
                      weekdayRow("Tuesday","Lower A"),
                      weekdayRow("Wednesday","Off"),
                      weekdayRow("Thursday","Upper B"),
                      weekdayRow("Friday","Lower B"),
                      weekdayRow("Saturday","Off"),
                      weekdayRow("Sunday","Off"),
                    ],
                  ),

                ],
              ),
              ),
            ),
            ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 10,),
            ),
            

            

            SliverToBoxAdapter(
              child: Container(


                padding: const EdgeInsets.all(10),
                child: Material(
                  
                  
                  elevation: 15,
                  color: Colors.teal.shade200,
                  borderRadius: BorderRadius.circular(20),

                  child: Container(
                    padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [

                        const Text("Upper A",
                            style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        const SizedBox(height: 5,),

                          Table(
                            children: [
                              _line1,
                              planRow("Incline Bench Press", "3", "8-10"),
                              planRow("One Arm Dumbbell Row", "3", "10-12"),
                              planRow("Seated Barbell Press", "3", "8-10"),
                              planRow("Pull Ups", "3", "10"),
                              planRow("Skullcrushers", "3", "	10-12"),
                              planRow("Dumbbell Curl", "3", "	10-12"),
                              
                            ],
                            ),
                        ],
                      ),
                    ),
                    ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 10,),
            ),

            SliverToBoxAdapter(
              child: Container(


                padding: const EdgeInsets.all(10),
                child: Material(

                  elevation: 15,
                  color: Colors.teal.shade200,
                  borderRadius: BorderRadius.circular(20),


                  child: Container(
                    padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [


                            const Text("Lower A",
                                    style: TextStyle(
                                    fontSize:20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  ),
                            const SizedBox(height: 5,),
                            Table(
                              children: [
                                _line1,
                                planRow("Squats", "3", "	8-10"),
                                planRow("Leg Curl", "3", "12-15"),
                                planRow("Leg Extension", "3", "12-15"),
                                planRow("Leg Press Calf Raise", "3", "15-20"),
                                planRow("Plank", "3", "60 sec"),
                                planRow("Twisting Hanging Knee Raise", "3", "20"),
                              ],
                              ),
                          ],
                        ),
                    ),
                    ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 10,),
            ),

            SliverToBoxAdapter(
              child: Container(

                padding: const EdgeInsets.all(10),
                child: Material(

                  elevation: 15,
                  color: Colors.teal.shade200,
                  borderRadius: BorderRadius.circular(20),

                  child: Container(
                    padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [

                          const Text("Upper B",
                                  style: TextStyle(
                                  fontSize:20,
                                  fontWeight: FontWeight.w600,
                                ),
                                ),
                          const SizedBox(height: 5,),
                          Table(
                            children: [
                              _line1,
                              planRow("Dumbbell Bench Press", "3", "10"),
                              planRow("Barbell Row", "3", "8-10"),
                              planRow("Dumbbell Lateral Raise", "3", "12-15"),
                              planRow("Lat Pull Down", "3", "10-12"),
                              planRow("Cable Tricep Extensions", "3", "10-12"),
                              planRow("EZ Bar Preacher Curl", "3", "10-12"),
                            ],
                            ),
                        ],
                      ),
                    ),
                    ),
              ),
            ),

           const SliverToBoxAdapter(
              child: SizedBox(height: 10,),
            ),

            SliverToBoxAdapter(
              child: Container(

                padding: const EdgeInsets.all(10),
                child: Material(
                  
                  elevation: 15,
                  color: Colors.teal.shade200,
                  borderRadius: BorderRadius.circular(20),

                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        
                        const Text("Lower B",
                                style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                        const SizedBox(height: 5,),
                        Table(
                          children: [
                            _line1,
                            planRow("Leg Press", "3", "15-20"),
                            planRow("Stiff Leg Deadlift", "3", "8-10"),
                            planRow("Walking Dumbbell Lunge", "3", "10"),
                            planRow("Seated Calf Raise", "3", "15-20"),
                            planRow("Cable Crunch", "3", "20"),
                            planRow("Russian Twist", "3", "20"),
                          ],
                          ),
                      ],
                    ),
                    ),
                    ),
              ),
            ),
        ],
      ),
    );
  }





TableRow weekdayRow(String day,String bodypart){

  return TableRow(

      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              const Icon(Icons.date_range_rounded,
              color: Colors.teal,
              ),
              Text(day),
            ],
          ),
          ),
        Padding(
        padding: const EdgeInsets.all(5),
        child: Text(bodypart),
        ), 
              ],
        );

}


TableRow planRow(String exercise, String sets, String reps){

    return TableRow(

      children: [
        
        Padding(
          padding: const EdgeInsets.all(5),
          child:  Text(exercise,),
          ),
        Padding(
        padding: const EdgeInsets.all(5),
        child: Text(sets),
        ),
        Padding(
        padding: const EdgeInsets.all(5),
        child: Text(reps),
        ),  
              ],
        ); 



}


}