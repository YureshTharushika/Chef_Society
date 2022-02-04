import 'package:chefsociety/screens/logged_in_page.dart';

import 'package:chefsociety/screens/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) => Scaffold(
     
     
     body: StreamBuilder(

       stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context,  snapshot) {

         if(snapshot.connectionState == ConnectionState.waiting){
            return   const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData){
            return const LoggedInPage();
          } else if(snapshot.hasError){
            return  const Center(child: Text('Something went wrong!'));
          }
         return  const SignInPage();
    },
        ),
    );
  
}