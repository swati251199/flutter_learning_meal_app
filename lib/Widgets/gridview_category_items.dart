import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_flutter_app/Modals%20/category.dart';

class GridviewCategory extends StatelessWidget {
  final category;
  final void Function() onselectedCategory;
  const GridviewCategory({super.key, required this.category, required this.onselectedCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectedCategory,
    //  splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.70),
              category.color.withOpacity(0.50),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.background,
                )),
      ),
    );
  }
}
