import 'package:flutter/material.dart';


class MidBmiWorkoutPlan extends StatelessWidget {
  const MidBmiWorkoutPlan({Key? key}) : super(key: key);

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
        child: Text("Warm-Up Sets",
                    style: TextStyle(
                      fontSize:18,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
        ),
        Padding(
        padding: EdgeInsets.all(5),
        child: Text("Work Sets",
                    style: TextStyle(
                      fontSize:18,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
        ),
        Padding(
        padding: EdgeInsets.all(5),
        child: Text("Rest in seconds",
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
                              image: AssetImage("assets/bmi/mid_bmi_appbar_bg.jpg"),
                              fit: BoxFit.cover,
                              ),
              title: Text("6 Week General Fitness Workout"),
              
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
                      weekdayRow("Monday","Day 1 - Speed and Agility"),
                      weekdayRow("Tuesday","Day 2 - Power"),
                      weekdayRow("Wednesday","Off"),
                      weekdayRow("Thursday","Day 3 - Strength"),
                      weekdayRow("Friday","Day 4 - Hypertrophy & Muscular Endurance"),
                      weekdayRow("Saturday","Day 5 - Optional Full Body Conditioning"),
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
                padding: const EdgeInsets.all(10),
              child: Column(
                children: [

                  const Text("Dynamic Warm-Up",
                          style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  const SizedBox(height: 5,),
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          Text("Exercise",
                              style: TextStyle(
                                fontSize:18,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                          Text("Reps",
                              style: TextStyle(
                                fontSize:18,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),


                      TableRow(
                        children: [
                          Text("Push-Ups"),
                          Text("20"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),


                      TableRow(
                        children: [
                          Text("Deep Bodyweight Squats"),
                          Text("20"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),


                      TableRow(
                        children: [
                          Text("Lying Ab Windshield Wipers"),
                          Text("10 (each side)"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Walking Lunges (long stride)"),
                          Text("20 paces"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),


                      TableRow(
                        children: [
                          Text("Inverted Rows"),
                          Text("10"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Jump Squats"),
                          Text("10"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Side Lunges"),
                          Text("10 (each side)"),
                        ],
                      ),
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

                        const Text("Day 1: Speed and Agility",
                            style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        const SizedBox(height: 5,),

                          Table(
                            children: [
                              _line1,
                              planRow("Sprints (at least 20 yards)", "3 minute jog", "5 rounds all-out effort","120"),
                              planRow("Timed shuttle run (at least 10 yards)", "-", "5 rounds all-out effort","60 to 120"),
                              planRow("Superset: Reverse Grip Chin-Up & Flat Bench Barbell Press", "1x12", "3x8-12","60 after each superset"),
                              planRow("Superset: Dumbbell Shrug & Hyperextension", "-", "3x8-12","60 after each superset"),
                              planRow("Superset: Floor Crunch & Bent-Knee Hanging Leg Raise", "-", "3x15-20","No Rest"),
                              planRow("3-5 mile Jog at a Steady Pace", "-", "-","-"),
                              
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


                            const Text("Day 2: Power",
                                    style: TextStyle(
                                    fontSize:20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  ),
                            const SizedBox(height: 5,),
                            Table(
                              children: [
                                _line1,
                                planRow("Jump Squats or Box Jumps", "1x10", "4x10","30"),
                                planRow("Barbell Clean and Press", "2x12-15", "3x5-8","60"),
                                planRow("Plyo (hand clap) Push-Up", "1x10", "3x5-8","30"),
                                planRow("Explosive Single Arm Dumbbell or Kettlebell Flat Bench Press", "-", "3x5-8","60"),
                                planRow("Explosive Bent-Over Dumbbell Row", "1x12", "3x5-8","60"),
                                planRow("3-Way Plank: alternate from side, middle to other side without rest (10sec each)", "-", "1 set alternating every 10 seconds for 1 to 2 minutes","-"),
                                planRow("Sprint Intervals: total of 8 sprints with one minute rests", "-", "-","-"),
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

                          const Text("Day 3: Strength",
                                  style: TextStyle(
                                  fontSize:20,
                                  fontWeight: FontWeight.w600,
                                ),
                                ),
                          const SizedBox(height: 5,),
                          Table(
                            children: [
                              _line1,
                              planRow("Barbell Floor Deadlift or Barbell Back Squat", "3x8-12", "4x5","120"),
                              planRow("Seated Leg Curl or Romanian Deadlift", "1x12", "4x5","120"),
                              planRow("Superset: Inverted or TRX Row & Plyo Push-Up", "-", "3x10-15","60 after each superset"),
                              planRow("Superset: Incline Bench Dumbbell Press & Wide-Grip Pull-Up", "2x12", "4x5-8","60 after each superset"),
                              planRow("Superset: Hanging Leg Raise & Planks", "-", "3x15-20 & 20-30 sec for planks","No rest"),
                              planRow("3-5 mile Jog at a steady pace", "-", "-","-"),
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
                        
                        const Text("Day 4: Hypertrophy & Muscular Endurance",
                                style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                        const SizedBox(height: 5,),
                        Table(
                          children: [
                            _line1,
                            planRow("Superset: Standing Barbell Shoulder Push Press & Rear Delt Rope Pull", "2x12", "4x10-15","No rest"),
                            planRow("Bulgarian Split Squat", "2x12", "4x10 each leg","30"),
                            planRow("Superset: Standing Barbell or TRX Curl & Parallel Bar Triceps Dips", "1x12", "4x10-15","No rest"),
                            planRow("Superset: Feet-Elevated Push-Up & Single Leg Calf Raise", "-", "3x10-15","No rest"),
                            planRow("Superset: Incline 3-Way Sit-Up & Lying Leg Raise", "-", "3x15-20","No rest"),
                            planRow("Sled Pull or Drag or Farmer's Walk", "-", "3 lengths","60"),
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
                padding: const EdgeInsets.all(10),
              child: Column(
                children: [

                  const Text("Day 5: Optional Full Body Conditioning",
                          style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  const SizedBox(height: 5,),
                  Table(
                    children: const [
                      TableRow(
                        
                        children: [
                          Text("Exercise",
                              style: TextStyle(
                                fontSize:18,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                          Text("Reps",
                              style: TextStyle(
                                fontSize:18,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Push-Ups"),
                          Text("20"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),
                      
                      TableRow(
                        children: [
                          Text("Prisoner Squat"),
                          Text("20"),
                        ],
                      ),


                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Pull-Up"),
                          Text("10"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Walking Lunges"),
                          Text("10 each leg"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Triceps Bench or Parallel Bar Dip"),
                          Text("10"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Short Sprint"),
                          Text("Varied lengths"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("Ab Crunch"),
                          Text("20"),
                        ],
                      ),

                       TableRow(
                        children: [
                          Text(""),
                          Text(""),

                        ],
                      ),

                      TableRow(
                        children: [
                          Text("*End with 3-5 mile jog at a steady pace"),
                          Text(""),
                        ],
                      ),
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


TableRow planRow(String exercise, String warmupsets, String worksets, String restinseconds){

    return TableRow(

      children: [
        
        Padding(
          padding: const EdgeInsets.all(5),
          child:  Text(exercise,),
          ),
        Padding(
        padding: const EdgeInsets.all(5),
        child: Text(warmupsets,),
        ),
        Padding(
        padding: const EdgeInsets.all(5),
        child: Text(worksets),
        ),
        Padding(
        padding: const EdgeInsets.all(5),
        child: Text(restinseconds),
        ),   
              ],
        ); 



}
  
}