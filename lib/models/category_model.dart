import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: "business",
        name: "Business",
        image: "assets/bussines.png",
        color: Color(0xFFCF7E48),
      ),
      CategoryModel(
          id: "entertainment",
          name: "Entertainment",
          image: "assets/environment.png",
          color: Colors.brown),
      CategoryModel(
          id: "general",
          name: "General",
          image: "assets/Politics.png",
          color: Color(0xFF4882CF)),
      CategoryModel(
          id: "health",
          name: "Health",
          image: "assets/health.png",
          color: Colors.pink),
      CategoryModel(
          id: "science",
          name: "Science",
          image: "assets/science.png",
          color: Colors.yellow),
      CategoryModel(
          id: "sports",
          name: "Sports",
          image: "assets/sports.png",
          color: Colors.red),
      CategoryModel(
          id: "technology",
          name: "Technology",
          image: "assets/environment.png",
          color: Colors.cyan),
    ];
  }
}
