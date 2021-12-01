

import 'package:chefsociety/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user object from firebase object

  UserModel? _userFromFirebase(User? user){
    return user != null ? UserModel(userId: user.uid) : null;
     

    
  }

//auth change user stream

  Stream<UserModel?> get myUser{
    return _auth
    .authStateChanges()
    .map((User? user) => _userFromFirebase(user));
    
  }



  //Anonymous Sign in

  Future signInAnonymous() async {

    try{
        UserCredential result = await _auth.signInAnonymously();

        User? user = result.user;
        return _userFromFirebase(user!);

    }catch(e){

      print(e.toString());
      return null;

    }

  }

  //SignUp with Email and Password

  Future registerWithEmailAndPassword(String email,String password) async {

    try{

      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);

    }
    catch(e){
      print(e.toString());
      return null;

    }

  }


  //SignIn with Email and Password

  Future signInWithEmailAndPassword(String email,String password) async {

    try{

      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);

    }
    catch(e){
      print(e.toString());
      return null;

    }

  }




  //Signout


  Future userSignout() async{

    try{
      return await _auth.signOut();

    }catch(e){
      print(e.toString());
      return null;

    }

  }

}