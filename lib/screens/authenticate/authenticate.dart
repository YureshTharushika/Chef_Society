import 'package:chefsociety/screens/authenticate/register.dart';
import 'package:chefsociety/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({ Key? key }) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signUpOrSignIn = true;

  void toggleView(){
    setState(() {
      signUpOrSignIn = !signUpOrSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if(signUpOrSignIn){
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }

  }
}