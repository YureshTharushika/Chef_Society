import 'package:chefsociety/screens/bmi_calculator_page.dart';
import 'package:chefsociety/screens/colorie_calculator_page.dart';
import 'package:chefsociety/screens/profile_page.dart';
import 'package:chefsociety/services/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DrawerList extends StatefulWidget {
  const DrawerList({ Key? key }) : super(key: key);

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {

    
   


    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1,"Profile",Icons.person,
                  currentTab == 1? true: false),
          menuItem(2,"BMI Calculator",Icons.calculate,
                  currentTab == 2? true: false),
          menuItem(3,"Calorie Calculator",Icons.calculate,
                  currentTab == 3? true: false),
          menuItem(4,"Logout",Icons.logout,
                  currentTab == 3? true: false),
        ],
      ),
      
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected){


    return Material(
      color: selected? Colors.grey[700]: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
            setState((){

              if(id ==1){
                currentTab = 1;
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProfilePage())
                              );
              }else if(id == 2){
                currentTab = 2;
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BMICalculatorPage())
                              );
              }else if(id == 3){
                currentTab = 3;
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CalorieCalculatorPage())
                              );
              }else if(id == 4){
                currentTab = 4;
                  final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                  provider.logOut();
              }

            });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),

          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.teal,
                  ),
                ),
              Expanded(
                flex: 3,
                child: Text(title,
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                            ),
                ),
            ],
          ),
          ),
      ),
    );
  }
}

