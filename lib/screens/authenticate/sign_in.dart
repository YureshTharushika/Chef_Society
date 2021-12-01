import 'package:chefsociety/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SignIn extends StatefulWidget {
  //const SignIn({ Key? key }) : super(key: key);


final Function toggleView;
SignIn({required this.toggleView});

  

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();
  final _signInFormKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Sign In to Chef Society'),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          reverse: true,
        child:  Form(
          key: _signInFormKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20,),
              TextFormField(
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter an email';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                validator: ( val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a password';
                          }
                    return null;
                    },
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20,),
               ElevatedButton(
                child: const Text('Sign In',
                          style: TextStyle(color: Colors.white),
                          ),
                onPressed: () async{
                  if(_signInFormKey.currentState!.validate()){
                    dynamic signedInUser = _authService.signInWithEmailAndPassword(email, password);
                    if(signedInUser == null){
                      setState(() {
                        error = 'something went wrong!';
                      });

                    }
                  }
                },
              ),
              const SizedBox(height: 20,),
              Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
              const Text(
                'Don\'t have an account?',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 12,),
              ElevatedButton(
                child: const Text('Signup Here!',
                          style: TextStyle(color: Colors.white),
                          ),
                onPressed: () {
                  widget.toggleView();
                },
              ),
            ],
            
          ),
          ),
        ),
      ),
    );
  }
}