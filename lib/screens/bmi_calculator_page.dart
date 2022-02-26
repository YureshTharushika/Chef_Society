import 'package:flutter/material.dart';

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
                onPressed: calculateBMI,
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

void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    setState(() {
      _result = result;
    });

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
  }

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
  }

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
  }
}