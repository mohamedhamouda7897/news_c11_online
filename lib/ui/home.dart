import 'package:flutter/material.dart';
import 'package:news_c11_online/models/category_model.dart';
import 'package:news_c11_online/ui/categories_tab.dart';
import 'package:news_c11_online/ui/drawer_widget.dart';
import 'package:news_c11_online/ui/news_ui.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerWidget(
          onClick: onDrawerClicked,
        ),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          backgroundColor: Colors.green,
          title: const Text(
            "News App",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
        ),
        body: categoryModel == null
            ? CategoriesTab(
                onClick: onCategorySelected,
              )
            : NewsUi(
                id: categoryModel!.id,
              ),
      ),
    );
  }

  CategoryModel? categoryModel;

  onDrawerClicked(id) {
    if (id == DrawerWidget.CATEGORY_ID) {
      categoryModel = null;
      Navigator.pop(context);
    } else if (id == DrawerWidget.SETTINGS_ID) {}
    setState(() {});
  }

  onCategorySelected(cat) {
    categoryModel = cat;
    setState(() {});
  }
}
