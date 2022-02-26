

import 'package:flutter/material.dart';


class ImagePickAndConfirmButton extends StatelessWidget {
 const ImagePickAndConfirmButton({ 
      Key? key ,
      required this.title,
      required this.icon,
      required this.onClicked,
      }) : super(key: key);

final String title;
final IconData icon;
final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: const TextStyle(fontSize: 20,),
      ),

      child: Row(
        children: [
          Icon(icon, size: 28,),
          const SizedBox(width: 10,),
          Text(title),
        ],
      ),
      onPressed: onClicked,
    );
  }
}