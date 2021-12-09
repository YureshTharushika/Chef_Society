

import 'package:chefsociety/shared/shared_widgets.dart';
import 'package:flutter/material.dart';


class RecipeMoreDetails extends StatefulWidget {
  const RecipeMoreDetails({ Key? key }) : super(key: key);

  @override
  _RecipeMoreDetailsState createState() => _RecipeMoreDetailsState();
}

class _RecipeMoreDetailsState extends State<RecipeMoreDetails> {
  
  final urlImage = '';
  
  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      image: NetworkImage(urlImage), 
      child: Scaffold(

    ),
    ); 
  }
}