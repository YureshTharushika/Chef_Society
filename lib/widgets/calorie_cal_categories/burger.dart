import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  const Burger({Key? key}) : super(key: key);

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  final TextEditingController _item1 = TextEditingController();
  final TextEditingController _item2 = TextEditingController();
  final TextEditingController _item3 = TextEditingController();
  final TextEditingController _item4 = TextEditingController();
  final TextEditingController _item5 = TextEditingController();
  final TextEditingController _item6 = TextEditingController();
  final TextEditingController _item7 = TextEditingController();
  final TextEditingController _item8 = TextEditingController();
  final TextEditingController _item9 = TextEditingController();
  final TextEditingController _item10 = TextEditingController();
  final TextEditingController _item11 = TextEditingController();
  final TextEditingController _item12 = TextEditingController();
  final TextEditingController _item13 = TextEditingController();
  final TextEditingController _item14 = TextEditingController();
  final TextEditingController _item15 = TextEditingController();
  final TextEditingController _item16 = TextEditingController();
  final TextEditingController _item17 = TextEditingController();

  double _totalCalory = 0.0;
  double _totalCarbohydrete = 0.0;
  double _totalFat = 0.0;

  double flourCal = 0.0;
  double cheeseCal = 0.0;
  double eggCal = 0.0;
  double mozzarellacheeseCal = 0.0;
  double butterCal = 0.0;
  double chickenCal = 0.0;
  double beefCal = 0.0;
  double porkCal = 0.0;
  double bakingpowderCal = 0.0;
  double hamCal = 0.0;
  double muttonCal = 0.0;
  double mayonnaiseCal = 0.0;
  double ketchupCal = 0.0;
  double tomatoCal = 0.0;
  double lettuceCal = 0.0;
  double onionCal = 0.0;
  double sesameseedCal = 0.0;

  double flourCarbs = 0.0;
  double cheeseCarbs = 0.0;
  double eggCarbs = 0.0;
  double mozzarellacheeseCarbs = 0.0;
  double butterCarbs = 0.0;
  double chickenCarbs = 0.0;
  double beefCarbs = 0.0;
  double porkCarbs = 0.0;
  double bakingpowderCarbs = 0.0;
  double hamCarbs = 0.0;
  double muttonCarbs = 0.0;
  double mayonnaiseCarbs = 0.0;
  double ketchupCarbs = 0.0;
  double tomatoCarbs = 0.0;
  double lettuceCarbs = 0.0;
  double onionCarbs = 0.0;
  double sesameseedCarbs = 0.0;

  double flourFat = 0.0;
  double cheeseFat = 0.0;
  double eggFat = 0.0;
  double mozzarellacheeseFat = 0.0;
  double butterFat = 0.0;
  double chickenFat = 0.0;
  double beefFat = 0.0;
  double porkFat = 0.0;
  double bakingpowderFat = 0.0;
  double hamFat = 0.0;
  double muttonFat = 0.0;
  double mayonnaiseFat = 0.0;
  double ketchupFat = 0.0;
  double tomatoFat = 0.0;
  double lettuceFat = 0.0;
  double onionFat = 0.0;
  double sesameseedFat = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          'Burger',
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/burger.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 15),
              TextField(
                controller: _item1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                //onChanged: (val){
                  //setState(() {flourCal = val as double;});
                //},
                decoration: InputDecoration(
                  labelText: 'Flour (g)',
                  suffixIcon: _item1.text.isNotEmpty? IconButton(
                      onPressed: () {
                        flourCal = 0.0;
                        flourCarbs = 0.0;
                        flourFat = 0.0;
                        setState(() {_item1.clear();});
                        },
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  ),
                ),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item2,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Cheese (g)',
                  suffixIcon: _item2.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        cheeseCal = 0.0;
                        cheeseCarbs = 0.0;
                        cheeseFat = 0.0;
                        setState(() {_item2.clear();});
                      }, 
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item3,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Eggs (count)',
                  suffixIcon: _item3.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        eggCal = 0.0;
                        eggCarbs = 0.0;
                        eggFat = 0.0;
                        setState(() {_item3.clear();});
                      },  
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item4,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                  ),
                decoration: InputDecoration(
                  labelText: 'Butter (g)',
                  suffixIcon: _item4.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        butterCal = 0.0;
                        butterCarbs = 0.0;
                        butterFat = 0.0;
                        setState(() {_item4.clear();});
                      },
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item5,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                  ),
                decoration: InputDecoration(
                  labelText: 'Mozeralla Cheese (g)',
                  suffixIcon: _item5.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                      ), 
                      onPressed: () {
                        mozzarellacheeseCal = 0.0;
                        mozzarellacheeseCarbs = 0.0;
                        mozzarellacheeseFat = 0.0;
                        setState(() {_item5.clear();});
                      }, 
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Chicken (g)',
                  suffixIcon: _item6.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        chickenCal = 0.0;
                        chickenCarbs = 0.0;
                        chickenFat = 0.0;
                        setState(() {_item6.clear();});
                      },
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item7,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Beef (g)',
                  suffixIcon: _item7.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        beefCal = 0.0;
                        beefCarbs = 0.0;
                        beefFat = 0.0;
                        setState(() {_item7.clear();});
                      },
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item8,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Pork (g)',
                  suffixIcon: _item8.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        porkCal = 0.0;
                        porkCarbs = 0.0;
                        porkFat = 0.0;
                        setState(() {_item8.clear();});
                      },
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item9,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Baking Powder (g)',
                  suffixIcon: _item9.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        bakingpowderCal = 0.0;
                        bakingpowderCarbs = 0.0;
                        bakingpowderFat = 0.0;
                        setState(() {_item9.clear();});
                      },  
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item10,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Ham (g)',
                  suffixIcon: _item10.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        hamCal = 0.0;
                        hamCarbs = 0.0;
                        hamFat = 0.0;
                        setState(() {_item10.clear();});
                      }, 
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item11,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Muttonn (g)',
                  suffixIcon: _item11.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        muttonCal = 0.0;
                        muttonCarbs = 0.0;
                        muttonFat = 0.0;
                        setState(() {_item11.clear();});
                      }, 
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item12,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Mayonnaise (g)',
                  suffixIcon: _item12.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        mayonnaiseCal = 0.0;
                        mayonnaiseCarbs = 0.0;
                        mayonnaiseFat = 0.0;
                        setState(() {_item12.clear();});
                      },  
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item13,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Ketchup (ml)',
                  suffixIcon: _item13.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        ketchupCal = 0.0;
                        ketchupCarbs = 0.0;
                        ketchupFat = 0.0;
                        setState(() {_item13.clear();});
                      },  
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item14,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Tomato (g)',
                  suffixIcon: _item14.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        tomatoCal = 0.0;
                        tomatoCarbs = 0.0;
                        tomatoFat = 0.0;
                        setState(() {_item14.clear();});
                      },  
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item15,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Lettuce (g)',
                  suffixIcon: _item15.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        lettuceCal = 0.0;
                        lettuceCarbs = 0.0;
                        lettuceFat = 0.0;
                        setState(() {_item15.clear();});
                      },  
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _item16,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[100],
                ),
                decoration: InputDecoration(
                  labelText: 'Onion (g)',
                  suffixIcon: _item16.text.isNotEmpty ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[100],
                        ), 
                      onPressed: () {
                        onionCal = 0.0;
                        onionCarbs = 0.0;
                        onionFat = 0.0;
                        setState(() {_item16.clear();});
                      },  
                  ) : null,
                  enabledBorder: inputBorder(),
                  focusedBorder: focusBorder(),
                  hintText: '0',
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[100],
                  )
                ),
              ),
              const SizedBox(height: 15),
                TextField(
                  controller: _item17,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[100],
                  ),
                  decoration: InputDecoration(
                    labelText: 'Sesame Seed (g)',
                    suffixIcon: _item16.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          sesameseedCal = 0.0;
                          sesameseedCarbs = 0.0;
                          sesameseedFat = 0.0;
                          setState(() {_item16.clear();});
                        },  
                    ) : null,
                    enabledBorder: inputBorder(),
                    focusedBorder: focusBorder(),
                    hintText: '0',
                    hintStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.blue[100],
                    )
                  ),
                ),
              const SizedBox(height: 40),
              ElevatedButton(
                child: Text(
                  "Calculate", 
                  style: TextStyle(
                    color: Colors.blue[100], 
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                ),
                //onPressed: calculateCalory,
                //onPressed: showDialog(context: context, builder: (BuildContext context) => errorDialog),
                onPressed : (){
                  calculateCalory();
                  calculateCarbohydrete();
                  calculateFat();
                  showDialog(
                  context: context, 
                  builder: (BuildContext context){
                    return Dialog(

                      child: Container(
                        margin: const EdgeInsets.only(left: 0.0,right: 0.0),
                        child: Stack(
                          children:<Widget> [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 18.0,
                                ),
                                margin: const EdgeInsets.only(top: 13.0,right: 8.0),
                                decoration: const BoxDecoration(
                                  //color: colors(),
                                  color: Colors.teal,
                                  shape: BoxShape.rectangle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 0.0,
                                      offset: Offset(0.0, 0.0),
                                    ),
                                  ]
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    const SizedBox(height: 20.0,),
                                    Center(
                                      child: Column(
                                        //padding: const EdgeInsets.all(10.0),
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget> [
                                          const Text(
                                            "Calories",
                                            style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                          _totalCalory == null ? "Enter Value" : "${_totalCalory.toStringAsFixed(2)}", 
                                          style: const TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white
                                           ),
                                          ),
                                          const SizedBox(height: 10),
                                          const Text(
                                            "Carbohydrets",
                                            style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white
                                           ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                          _totalCarbohydrete == null ? "Enter Value" : "${_totalCarbohydrete.toStringAsFixed(2)}", 
                                          style: const TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white
                                           ),
                                          ),

                                          const SizedBox(height: 10),
                                          const Text(
                                            "Fat",
                                            style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white
                                           ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                          _totalFat == null ? "Enter Value" : "${_totalFat.toStringAsFixed(2)}", 
                                          style: const TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white
                                           ),
                                          ),
                                        ] 
                                      )//
                                    ),
                                    const SizedBox(height: 24.0),
                                    OutlinedButton(
                                      child: const Text(
                                        'Got It!', 
                                        style: TextStyle(
                                          color: Colors.white, 
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                          ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                       // _item1.dispose();
                                       // _item2.dispose();
                                       // _item3.dispose();
                                       // _item4.dispose();
                                      },          
                                    )
                                  ],
                                ),
                            ),
                            
                            Positioned(
                              right: 0.0,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: const Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.close, color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),


                    );
                  },
                  );
                }
                  
              ),
              const SizedBox(height: 15),
  
            ],
          ),
        ),
      ),
        ],
      ),
      
    );
  }
 

  OutlineInputBorder focusBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.tealAccent.shade400,
          width: 3,
        )
    );
  }

  OutlineInputBorder inputBorder(){
    return OutlineInputBorder( 
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.redAccent.shade400,
          width: 3,
        )
    );
  }

  calculateCalory() {

    if(_item1.text.isNotEmpty) {
      flourCal = double.parse(_item1.value.text) * 4;
    }
    if(_item2.text.isNotEmpty) {
      cheeseCal = double.parse(_item2.value.text) * 4.02;
    }
    if(_item3.text.isNotEmpty) {
      eggCal = double.parse(_item3.value.text) * 155;
    }
    if(_item4.text.isNotEmpty) {
      butterCal = double.parse(_item4.value.text) * 7;
    }
    if(_item5.text.isNotEmpty) {
      mozzarellacheeseCal = double.parse(_item5.value.text) * 2.8;
    }
    if(_item6.text.isNotEmpty) {
      chickenCal = double.parse(_item6.value.text) * 2.39;
    }
    if(_item7.text.isNotEmpty) {
      beefCal = double.parse(_item7.value.text) * 2.42;
    }
    if(_item8.text.isNotEmpty) {
      porkCal = double.parse(_item8.value.text) * 5.46;
    }
    if(_item9.text.isNotEmpty) {
      bakingpowderCal = double.parse(_item9.value.text) * 0.53;
    }
    if(_item10.text.isNotEmpty) {
      hamCal = double.parse(_item10.value.text) * 1.45;
    }
    if(_item11.text.isNotEmpty) {
      muttonCal = double.parse(_item11.value.text) * 2.94;
    }
    if(_item12.text.isNotEmpty) {
      mayonnaiseCal = double.parse(_item12.value.text) * 6.8;
    }
    if(_item13.text.isNotEmpty) {
      ketchupCal = double.parse(_item13.value.text) * 1.28;
    }
    if(_item14.text.isNotEmpty) {
      tomatoCal = double.parse(_item14.value.text) * 0.18;
    }
    if(_item15.text.isNotEmpty) {
      lettuceCal = double.parse(_item15.value.text) * 0.15;
    }
    if(_item16.text.isNotEmpty) {
      onionCal = double.parse(_item16.value.text) * 0.4;
    }
    if(_item17.text.isNotEmpty) {
      sesameseedCal = double.parse(_item17.value.text) * 5.73;
    }

    double result = flourCal+cheeseCal+eggCal+butterCal+mozzarellacheeseCal+chickenCal+beefCal+porkCal+
    bakingpowderCal+hamCal+muttonCal+mayonnaiseCal+ketchupCal+tomatoCal+lettuceCal+onionCal+sesameseedCal;
    
     //_result = result;
    setState(() {
      _totalCalory = result;
      print(_totalCalory);
    });

  }

  calculateCarbohydrete() {

    if(_item1.text.isNotEmpty) {
      flourCarbs = double.parse(_item1.value.text) * 0.76;
    }
    if(_item2.text.isNotEmpty) {
      cheeseCarbs = double.parse(_item2.value.text) * 0.013;
    }
    if(_item3.text.isNotEmpty) {
      eggCarbs = double.parse(_item3.value.text) * 0.001;
    }
    if(_item4.text.isNotEmpty) {
      butterCarbs = double.parse(_item4.value.text) * 0.6;
    }
    if(_item5.text.isNotEmpty) {
      mozzarellacheeseCarbs = double.parse(_item5.value.text) * 0.031;
    }
    if(_item6.text.isNotEmpty) {
      chickenCarbs = double.parse(_item6.value.text) * 0;
    }
    if(_item7.text.isNotEmpty) {
      beefCarbs = double.parse(_item7.value.text) * 0;
    }
    if(_item8.text.isNotEmpty) {
      porkCarbs = double.parse(_item8.value.text) * 0;
    }
    if(_item9.text.isNotEmpty) {
      bakingpowderCarbs = double.parse(_item9.value.text) * 0.28;
    }
    if(_item10.text.isNotEmpty) {
      hamCarbs = double.parse(_item10.value.text) * 0.015;
    }
    if(_item11.text.isNotEmpty) {
      muttonCarbs = double.parse(_item11.value.text) * 0;
    }
    if(_item12.text.isNotEmpty) {
      mayonnaiseCarbs = double.parse(_item12.value.text) * 0.006;
    }
    if(_item13.text.isNotEmpty) {
      ketchupCarbs = double.parse(_item13.value.text) * 0.304;
    }
    if(_item14.text.isNotEmpty) {
      tomatoCarbs = double.parse(_item14.value.text) * 0.039;
    }
    if(_item15.text.isNotEmpty) {
      lettuceCarbs = double.parse(_item15.value.text) * 0.029;
    }
    if(_item16.text.isNotEmpty) {
      onionCarbs = double.parse(_item16.value.text) * 0.09;
    }
    if(_item17.text.isNotEmpty) {
      sesameseedCarbs = double.parse(_item17.value.text) * 0.23;
    }

    double result = flourCarbs+cheeseCarbs+eggCarbs+butterCarbs+mozzarellacheeseCarbs+chickenCarbs+beefCarbs+
    porkCarbs+bakingpowderCarbs+hamCarbs+muttonCarbs+mayonnaiseCarbs+ketchupCarbs+tomatoCarbs+lettuceCarbs+
    onionCarbs+sesameseedCarbs;
    
     //_result = result;
    setState(() {
      _totalCarbohydrete = result;
      print(_totalCarbohydrete);
    });

  }

  calculateFat() {

    if(_item1.text.isNotEmpty) {
      flourFat = double.parse(_item1.value.text) * 0.01;
    }
    if(_item2.text.isNotEmpty) {
      cheeseFat = double.parse(_item2.value.text) * 0.33;
    }
    if(_item3.text.isNotEmpty) {
      eggFat = double.parse(_item3.value.text) * 5;
    }
    if(_item4.text.isNotEmpty) {
      butterFat = double.parse(_item4.value.text) * 0.81;
    }
    if(_item5.text.isNotEmpty) {
      mozzarellacheeseFat = double.parse(_item5.value.text) * 0.17;
    }
    if(_item6.text.isNotEmpty) {
      chickenFat = double.parse(_item6.value.text) * 0.14;
    }
    if(_item7.text.isNotEmpty) {
      beefFat = double.parse(_item7.value.text) * 0.15;
    }
    if(_item8.text.isNotEmpty) {
      porkFat = double.parse(_item8.value.text) * 0.14;
    }
    if(_item9.text.isNotEmpty) {
      bakingpowderFat = double.parse(_item9.value.text) * 0;
    }
    if(_item10.text.isNotEmpty) {
      hamFat = double.parse(_item10.value.text) * 0.06;
    }
    if(_item11.text.isNotEmpty) {
      muttonFat = double.parse(_item11.value.text) * 0.21;
    }
    if(_item12.text.isNotEmpty) {
      mayonnaiseFat = double.parse(_item12.value.text) * 0.75;
    }
    if(_item13.text.isNotEmpty) {
      ketchupFat = double.parse(_item13.value.text) * 0;
    }
    if(_item14.text.isNotEmpty) {
      tomatoFat = double.parse(_item14.value.text) * 0.002;
    }
    if(_item15.text.isNotEmpty) {
      lettuceFat = double.parse(_item15.value.text) * 0.002;
    }
    if(_item16.text.isNotEmpty) {
      onionFat = double.parse(_item16.value.text) * 0.001;
    }
    if(_item17.text.isNotEmpty) {
      sesameseedFat = double.parse(_item17.value.text) * 0.5;
    }

    double result = flourFat+cheeseFat+eggFat+butterFat+mozzarellacheeseFat+chickenFat+beefFat+porkFat+
    bakingpowderFat+hamFat+muttonFat+mayonnaiseFat+ketchupFat+tomatoFat+lettuceFat+onionFat+sesameseedFat;
    
     //_result = result;
    setState(() {
      _totalFat = result;
      print(_totalFat);
    });

  }

  /*
  String message() {
    if(_totalCalory == 0) 
    {
      return "";
    }
    else if(_totalCalory > 0 && _totalCalory < 16)
    {
      return "Very Severely UnderWeight";
    }
    else if(_totalCalory >= 16 && _totalCalory < 17)
    {
      return "Severely UnderWeight";
    }
    else if(_totalCalory >= 17 && _totalCalory < 18.5)
    {
      return "UnderWeight";
    }
    else if(_totalCalory >= 18.5 && _totalCalory < 25)
    {
      return "Healthy"; 
    }
    else if(_totalCalory >= 25 && _totalCalory < 30)
    {
      return "Overweight";
    }
    else if(_totalCalory >= 30 && _totalCalory < 35)
    {
      return "Obese Class I";
    }
    else if(_totalCalory >= 35 && _totalCalory < 40)
    {
      return "Obese Class II";
    }
    else if(_totalCalory >= 40)
    {
      return "Obese Class III";
    }
    else
    {
      return "null";
    }
  }


  String advise() {
    if(_totalCalory == 0.00) 
    {
      return "";
    }
    else if(_totalCalory < 18.5)
    {
      return "Time to grab a bite";
    }
    else if(_totalCalory >= 18.5 && _totalCalory < 25)
    {
      return "Great Shape";
    }
    else if(_totalCalory >= 25)
    {
      return "Time for a run";
    }
    else
    {
      return "null";
    }
  }

  colors() {
    if(_totalCalory < 18.5)
    {
      return Colors.redAccent;
    }
    else if(_totalCalory >= 18.5 && _totalCalory < 25)
    {
      return Colors.green;
    }
    else if(_totalCalory >= 25)
    {
      return Colors.red;
    }
  }
  */


}
