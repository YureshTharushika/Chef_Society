import 'package:chefsociety/models/user.dart';
import 'package:chefsociety/screens/authenticate/authenticate.dart';
import 'package:chefsociety/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userFromStream = Provider.of<UserModel?>(context);

    if(userFromStream == null){
      return const Authenticate();
    }else{
      return  Home();
    }
  }
}