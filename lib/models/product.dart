import 'package:flutter/material.dart';





class Product {
  final String image, title, description;
  final int price, contact, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.contact,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      contact: 0711292927,
      title: "Resturant chef",
      price: 234,
      description: dummyText,
      image: "assets/images/home4.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Personal chef",
      price: 1234,
      contact: 0552294736,
      description: dummyText,
      image: "assets/images/home2.jpg",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Baking and Pastry",
      price: 230,
      contact: 0712468909,
      description: dummyText,
      image: "assets/images/home3.jpg",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "caterar",
      price: 124,
      contact: 0712701598,
      description: dummyText,
      image: "assets/images/home6.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Bartendar",
      price: 290,
      contact: 011122567,
      description: dummyText,
      image: "assets/images/home5.jpg",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Cake Designer",
    price: 1234,
    contact: 0783458929,
    description: dummyText,
    image: "assets/images/chefbg.jpg",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
