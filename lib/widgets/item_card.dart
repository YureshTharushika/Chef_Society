

import 'package:chefsociety/shared/constants.dart';


import 'package:flutter/material.dart';



class ItemCard extends StatelessWidget {

  final String title;
  final String jobpicurl;
  final String salary;
  final VoidCallback press;

  const ItemCard({
    Key? key,
    required this.title,
    required this.jobpicurl,
    required this.salary,
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2),
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
          Text(
            "\Rs${salary}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ],
      ),
    );
  }
}
