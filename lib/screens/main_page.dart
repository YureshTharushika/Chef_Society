
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:chefsociety/screens/logged_in_page.dart';
import 'package:chefsociety/screens/q_and_a_page.dart';
import 'package:chefsociety/screens/jobs_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int index = 1;

  final screens = [
        QandAPage(),
        LoggedInPage(),
        JobsPage(),

  ];

  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      Icon(Icons.comment, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      //extendBody: true,
      body: screens[index],

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}