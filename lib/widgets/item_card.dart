

import 'package:chefsociety/shared/constants.dart';


import 'package:flutter/material.dart';



class ItemCard extends StatelessWidget {

  final String title;
  final String jobpicurl;
  final String country;
  final VoidCallback press;

  const ItemCard({
    Key? key,
    required this.title,
    required this.jobpicurl,
    required this.country,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(kDefaultPaddin),
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white,
                          Color(0xFF2ECC71)
                        ],
                        ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.teal.shade300,
                      width: 2),
                      image: DecorationImage(
                        image: NetworkImage(jobpicurl),
                        fit: BoxFit.cover,
                      ),
                      ),
                      ),
                      ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(title,
                style: const TextStyle(color: kTextDarkGreen, fontSize: 18)),
          ),
          Row(
            children: [

              Icon(
                    Icons.public,
                    color: Colors.grey[800],
                    size: 18.0,
                    ),

              Text(
            "${country}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),

            ],
          ),
        ],
      ),
    );
  }
}
