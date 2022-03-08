import 'package:flutter/material.dart';



class LowBmiWorkoutPlan extends StatelessWidget {
  const LowBmiWorkoutPlan({ Key? key }) : super(key: key);

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
                              image: AssetImage("assets/bmi/low_bmi_appbar_bg.jpg"),
                              fit: BoxFit.cover,
                              ),
              title: Text("12 Week Muscle Gainer Workout",),
              
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
                      weekdayRow("Monday","Chest and Biceps"),
                      weekdayRow("Tuesday","Off"),
                      weekdayRow("Wednesday","Quads and Hamstrings"),
                      weekdayRow("Thursday","Shoulders and Triceps"),
                      weekdayRow("Friday","Off"),
                      weekdayRow("Saturday","Back, Calves and Abs"),
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

                        const Text("Monday - Chest and Biceps",
                            style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        const SizedBox(height: 5,),

                          Table(
                            children: [
                              _line1,
                              planRow("Bench Press - Power", "4", "3 to 5"),
                              planRow("Incline Bench Press  - Muscle", "2-3", "6 to 12"),
                              planRow("Dumbbell Bench Press - Muscle", "2-3", "6 to 12"),
                              planRow("Dumbbell Flys - Burn", "2", "40"),
                              planRow("Pinwheel Curls - Power", "2", "	3 to 5"),
                              planRow("Standing Barbell Curl  - Muscle", "2-3", "6 to 12"),
                              planRow("Cable Preacher Curl - Burn", "1-2", "40"),
                              
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


                            const Text("Wednesday - Quads and Hamstrings",
                                    style: TextStyle(
                                    fontSize:20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  ),
                            const SizedBox(height: 5,),
                            Table(
                              children: [
                                _line1,
                                planRow("Squat - Power", "4", "3 to 5"),
                                planRow("Leg Press  - Muscle", "2-3", "6 to 12"),
                                planRow("Front Squat - Muscle", "2-3", "6 to 12"),
                                planRow("Leg Press - Burn", "2", "40"),
                                planRow("Romanian Deadlift - Power", "2-4", "3 to 5"),
                                planRow("Romanian Deadlift or Leg Curl  - Muscle", "2-3", "6 to 12"),
                                planRow("Leg Curl - Burn", "1", "40"),
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

                          const Text("Thursday - Shoulders and Triceps",
                                  style: TextStyle(
                                  fontSize:20,
                                  fontWeight: FontWeight.w600,
                                ),
                                ),
                          const SizedBox(height: 5,),
                          Table(
                            children: [
                              _line1,
                              planRow("Seated Barbell Press - Power", "4", "3 to 5"),
                              planRow("Seated Arnold Press  - Muscle", "2-3", "6 to 12"),
                              planRow("Barbell Front Raise - Muscle", "2-3", "6 to 12"),
                              planRow("Dumbbell Lateral Raise - Burn", "2", "40"),
                              planRow("Closegrip Bench Press - Power", "2", "3 to 5"),
                              planRow("Seated French Press  - Muscle", "2", "6 to 12"),
                              planRow("EZ Bar Skullcrusher - Muscle", "2", "6 to 12"),
                              planRow("Cable Tricep Extension - Burn", "1", "40"),
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
                        
                        const Text("Saturday - Back, Calves, and Abs",
                                style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                        const SizedBox(height: 5,),
                        Table(
                          children: [
                            _line1,
                            planRow("Deadlift - Power", "2-4", "3 to 5"),
                            planRow("Barbell Rows - Muscle", "2-3", "6 to 12"),
                            planRow("Lat Pull Down - Muscle", "2-3", "6 to 12"),
                            planRow("Seated Cable Row - Burn", "2", "40"),
                            planRow("Seated Calf Raise - Muscle", "2-3", "10 to 15"),
                            planRow("45 Degree Calf Raise  - Burn", "2", "40"),
                            planRow("**Perform Ab work of choice***", "", ""),
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