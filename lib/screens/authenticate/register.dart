import 'package:chefsociety/services/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  //const Register({ Key? key }) : super(key: key);


final Function toggleView;
Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

final AuthService _authService = AuthService();
final _registerFormKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Sign Up to Chef Society'),
      ),

      body: Container(
        width: double.infinity,
        
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          reverse: true,
        child:  Form(
          key:_registerFormKey,
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
                child: const Text('Sign Up',
                          style: TextStyle(color: Colors.white),
                          ),
                onPressed: () async{
                  if(_registerFormKey.currentState!.validate()){
                    dynamic registeredUser = _authService.registerWithEmailAndPassword(email, password);
                    if(registeredUser == null){
                      setState(() {
                        error = 'please enter a valid email!';
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
                'Already have an account?',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 12,),
              ElevatedButton(
                child: const Text('SignIn Here!',
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