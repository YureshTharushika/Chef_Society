import 'package:chefsociety/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chefsociety/screens/home/components/body.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar();
    // backgroundColor: Colors.white,
    // elevation: 0,
    // leading: IconButton(
    //   icon: Icon(Icons.arrow_back_ios_new),
    //   color: Colors.black,
    //   onPressed: () {
    //     // DataReceiver();
    //     // assets/icons/back.png
    //   },
    // ),
    // actions: <Widget>[]);
  }
}
