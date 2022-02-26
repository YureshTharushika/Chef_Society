import 'package:chefsociety/services/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';



class SignInPage extends StatelessWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          FlutterLogo(size: 120,),
          Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Hey There,\nWelcome Back!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          const SizedBox(height: 8,),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Login to your account to continue..',
            style: TextStyle(
              fontSize: 16,
            ),
            ),
          ),
           Spacer(),
           ElevatedButton.icon(
             style: ElevatedButton.styleFrom(
               primary: Colors.white,
               onPrimary: Colors.black,
               minimumSize: const Size(double.infinity, 50)
             ),
             icon: const FaIcon(FontAwesomeIcons.google,color: Colors.lightBlueAccent,),
             label: const Text('Sign In with Google'),
             onPressed: (){
               final provider = Provider.of<GoogleSignInProvider>(context, listen: false);

               provider.googleLogIn();

             },
           ),
            const SizedBox(height: 40,),
        ],
      ),
      
    );
  }
}