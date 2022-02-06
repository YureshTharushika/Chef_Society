import 'package:flutter/material.dart';

class Cake extends StatefulWidget {
  const Cake({Key? key}) : super(key: key);

  @override
  _CakeState createState() => _CakeState();
}

class _CakeState extends State<Cake> {
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

  double _totalCalory = 0.0;
  double _totalCarbohydrete = 0.0;
  double _totalFat = 0.0;

  double flourCal = 0.0;
  double sugarCal = 0.0;
  double eggCal = 0.0;
  double milkCal = 0.0;
  double butterCal = 0.0;
  double icingCal = 0.0;
  double cocoapowderCal = 0.0;
  double chocolateCal = 0.0;
  double bakingpowderCal = 0.0;
  double nutellaCal = 0.0;
  double coconutCal = 0.0;
  double dateCal = 0.0;

  double flourCarbs = 0.0;
  double sugarCarbs = 0.0;
  double eggCarbs = 0.0;
  double milkCarbs = 0.0;
  double butterCarbs = 0.0;
  double icingCarbs = 0.0;
  double cocoapowderCarbs = 0.0;
  double chocolateCarbs = 0.0;
  double bakingpowderCarbs = 0.0;
  double nutellaCarbs = 0.0;
  double coconutCarbs = 0.0;
  double dateCarbs = 0.0;

  double flourFat = 0.0;
  double sugarFat = 0.0;
  double eggFat = 0.0;
  double milkFat = 0.0;
  double butterFat = 0.0;
  double icingFat = 0.0;
  double cocoapowderFat = 0.0;
  double chocolateFat = 0.0;
  double bakingpowderFat = 0.0;
  double nutellaFat = 0.0;
  double coconutFat = 0.0;
  double dateFat = 0.0;

/*
  Dialog errorDialog = Dialog(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
  child: Container(
    height: 300.0,
    width: 300.0,
   
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.all(15.0),
          child: Text('Cool', style: TextStyle(color: Colors.red),),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('Awesome', style: TextStyle(color: Colors.red),),
        ),
        Padding(padding: EdgeInsets.only(top: 50.0)),
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        },
            child: Text('Got It!', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
      ],
    ),
  ),
);
//showDialog(context: context, builder: (BuildContext context) => errorDialog);}
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cakes',
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
        children:[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/cake.jpg"),
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
                    labelText: 'Suger (g)',
                    suffixIcon: _item2.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          sugarCal = 0.0;
                          sugarCarbs = 0.0;
                          sugarFat = 0.0;
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
                    color: Colors.blue[100],),
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
                    color: Colors.blue[100],),
                  decoration: InputDecoration(
                    labelText: 'Milk (ml)',
                    suffixIcon: _item5.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          milkCal = 0.0;
                          milkCarbs = 0.0;
                          milkFat = 0.0;
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
                    color: Colors.blue[100],),
                  decoration: InputDecoration(
                    labelText: 'Icing Sugar (g)',
                    suffixIcon: _item6.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          icingCal = 0.0;
                          icingCarbs = 0.0;
                          icingFat = 0.0;
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
                    color: Colors.blue[100],),
                  decoration: InputDecoration(
                    labelText: 'Cocoa Powder (g)',
                    suffixIcon: _item7.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          cocoapowderCal = 0.0;
                          cocoapowderCarbs = 0.0;
                          cocoapowderFat = 0.0;
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
                    color: Colors.blue[100],),
                  decoration: InputDecoration(
                    labelText: 'Chocolate (g)',
                    suffixIcon: _item8.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          chocolateCal = 0.0;
                          chocolateCarbs = 0.0;
                          chocolateFat = 0.0;
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
                    color: Colors.blue[100],),
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
                    color: Colors.blue[100],),
                  decoration: InputDecoration(
                    labelText: 'Nutella (g)',
                    suffixIcon: _item10.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          nutellaCal = 0.0;
                          nutellaCarbs = 0.0;
                          nutellaFat = 0.0;
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
                    color: Colors.blue[100],),
                  decoration: InputDecoration(
                    labelText: 'Coconut (g)',
                    suffixIcon: _item11.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          coconutCal = 0.0;
                          coconutCarbs = 0.0;
                          coconutFat = 0.0;
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
                    color: Colors.blue[100],),
                  decoration: InputDecoration(
                    labelText: 'Dates (g)',
                    suffixIcon: _item12.text.isNotEmpty ? IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue[100],
                          ), 
                        onPressed: () {
                          dateCal = 0.0;
                          dateCarbs = 0.0;
                          dateFat = 0.0;
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
      ]
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
    return  OutlineInputBorder( 
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color: Colors.redAccent.shade400,
          width: 3,
        )
    );
  }

  calculateCalory() {

    if(_item1.text.isNotEmpty) {
      flourCal = double.parse(_item1.value.text) * 4;
    }
    if(_item2.text.isNotEmpty) {
      sugarCal = double.parse(_item2.value.text) * 4;
    }
    if(_item3.text.isNotEmpty) {
      eggCal = double.parse(_item3.value.text) * 155;
    }
    if(_item4.text.isNotEmpty) {
      butterCal = double.parse(_item4.value.text) * 7;
    }
    if(_item5.text.isNotEmpty) {
      milkCal = double.parse(_item5.value.text) * 0.44;
    }
    if(_item6.text.isNotEmpty) {
      icingCal = double.parse(_item6.value.text) * 3.89;
    }
    if(_item7.text.isNotEmpty) {
      cocoapowderCal = double.parse(_item7.value.text) * 2.28;
    }
    if(_item8.text.isNotEmpty) {
      chocolateCal = double.parse(_item8.value.text) * 5.46;
    }
    if(_item9.text.isNotEmpty) {
      bakingpowderCal = double.parse(_item9.value.text) * 0.53;
    }
    if(_item10.text.isNotEmpty) {
      nutellaCal = double.parse(_item10.value.text) * 5.41;
    }
    if(_item11.text.isNotEmpty) {
      coconutCal = double.parse(_item11.value.text) * 3.54;
    }
    if(_item12.text.isNotEmpty) {
      dateCal = double.parse(_item12.value.text) * 2.82;
    }

    double result = flourCal+sugarCal+eggCal+butterCal+milkCal+icingCal+cocoapowderCal+chocolateCal+
    bakingpowderCal+nutellaCal+coconutCal+dateCal;
    
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
      sugarCarbs = double.parse(_item2.value.text) * 1;
    }
    if(_item3.text.isNotEmpty) {
      eggCarbs = double.parse(_item3.value.text) * 0.001;
    }
    if(_item4.text.isNotEmpty) {
      butterCarbs = double.parse(_item4.value.text) * 0.6;
    }
    if(_item5.text.isNotEmpty) {
      milkCarbs = double.parse(_item5.value.text) * 0.05;
    }
    if(_item6.text.isNotEmpty) {
      icingCarbs = double.parse(_item6.value.text) * 1;
    }
    if(_item7.text.isNotEmpty) {
      cocoapowderCarbs = double.parse(_item7.value.text) * 0.58;
    }
    if(_item8.text.isNotEmpty) {
      chocolateCarbs = double.parse(_item8.value.text) * 0.61;
    }
    if(_item9.text.isNotEmpty) {
      bakingpowderCarbs = double.parse(_item9.value.text) * 0.28;
    }
    if(_item10.text.isNotEmpty) {
      nutellaCarbs = double.parse(_item10.value.text) * 0.62;
    }
    if(_item11.text.isNotEmpty) {
      coconutCarbs = double.parse(_item11.value.text) * 0.15;
    }
    if(_item12.text.isNotEmpty) {
      dateCarbs = double.parse(_item12.value.text) * 0.75;
    }

    double result = flourCarbs+sugarCarbs+eggCarbs+butterCarbs+milkCarbs+icingCarbs+cocoapowderCarbs+chocolateCarbs+
    bakingpowderCarbs+nutellaCarbs+coconutCarbs+dateCarbs;
    
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
      sugarFat = double.parse(_item2.value.text) * 0;
    }
    if(_item3.text.isNotEmpty) {
      eggFat = double.parse(_item3.value.text) * 5;
    }
    if(_item4.text.isNotEmpty) {
      butterFat = double.parse(_item4.value.text) * 0.81;
    }
    if(_item5.text.isNotEmpty) {
      milkFat = double.parse(_item5.value.text) * 0.01;
    }
    if(_item6.text.isNotEmpty) {
      icingFat = double.parse(_item6.value.text) * 0;
    }
    if(_item7.text.isNotEmpty) {
      cocoapowderFat = double.parse(_item7.value.text) * 0.14;
    }
    if(_item8.text.isNotEmpty) {
      chocolateFat = double.parse(_item8.value.text) * 0.31;
    }
    if(_item9.text.isNotEmpty) {
      bakingpowderFat = double.parse(_item9.value.text) * 0;
    }
    if(_item10.text.isNotEmpty) {
      nutellaFat = double.parse(_item10.value.text) * 0.3;
    }
    if(_item11.text.isNotEmpty) {
      coconutFat = double.parse(_item11.value.text) * 0.33;
    }
    if(_item12.text.isNotEmpty) {
      dateFat = double.parse(_item12.value.text) * 0.04;
    }

    double result = flourFat+sugarFat+eggFat+butterFat+milkFat+icingFat+cocoapowderFat+chocolateFat+
    bakingpowderFat+nutellaFat+coconutFat+dateFat;
    
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
