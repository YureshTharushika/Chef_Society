import 'package:flutter/material.dart';

class Categories extends StatelessWidget {


  final categories = [ 'Any',
                  'Appetisers',
                  'Baked Goods',
                  'Breakfast',
                  'Dessert',
                  'Dinner',
                  'Drinks',
                  'Lunch',
                  'Main-Course',
                  'Salads',
                  'Side-Dishes',
                  'Snacks',
                  'Soups'
                  ];

  Categories({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Colors.white,
         borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade600 , width: 1),
      ),
      height: 60,
      

      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10,horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: 13,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade600 , width: 1),
              ),
              child: Text(categories[index],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            ),
            ),
            );
        }),
      
    );
  }
}