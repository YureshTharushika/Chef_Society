import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HeaderDrawer extends StatefulWidget {
  
  const HeaderDrawer({ Key? key }) : super(key: key);

  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;


    return Container(
      color: Colors.teal,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom:10.0),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.photoURL!)),
            ),
          ),
          Text(user.displayName!,
          style: TextStyle(color: Colors.white,fontSize: 20),
          ),
        ],
      ),
    );
  }
}