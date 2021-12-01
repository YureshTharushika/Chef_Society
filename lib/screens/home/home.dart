import 'package:chefsociety/services/auth.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);

final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.logout),
            label: Text('logout'),
            onPressed:()async{
                await _authService.userSignout();
            },
            ),
        ],
      ),
    );
  }
}