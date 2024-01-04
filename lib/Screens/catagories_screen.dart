import 'package:flutter/material.dart';
import 'package:meals_flutter_app/Screens/meals_screen.dart';
import '../Data/dummy_data.dart';
import '../Modals /category.dart';
import '../Modals /meals.dart';
import '../Widgets/gridview_category_items.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key,  required this.availableMealsByFilter})
      : super(key: key);

  final List<Meal> availableMealsByFilter;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late  AnimationController _animationController ;

  void selectCategory(BuildContext context, Category category) {
    final filteredList = widget.availableMealsByFilter
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealScreen(
              title: category.title,
              meals: filteredList,
            )));
  }
@override
  void initState() {
    super.initState();
    _animationController =AnimationController(
        vsync:this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:_animationController,
      child: GridView(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          children: [
            // availableCategories.map((category) =>  GridviewCategory(category : category)).toList(), // way 1
            for (final category in availableCategories)
              GridviewCategory(
                category: category,
                onselectedCategory: () {
                  selectCategory(context, category);
                },
              )
          ]),
      builder: (context,child ) => Padding(padding: EdgeInsets.only(top: 100 - _animationController.value *100),
      child: child) ,
    );
  }
}
