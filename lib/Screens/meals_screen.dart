import 'package:flutter/material.dart';
import 'package:meals_flutter_app/Widgets/meals_item.dart';
import '../Modals /meals.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    Key? key,
    this.title,
   required this.meals,
  }) : super(key: key);
  final String ? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          // return widget( A separate class) as a screen ...
return MealsItem(meal: meals[index], );

    });

    if (meals.isEmpty) {
      content =  Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" Uh Oh .......Nothing Here !!!!",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
            const SizedBox(
              height: 20,
            ),
            Text("add recipe ",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white))
          ],
        ),
      );
    }
    if(title == null){
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!,style: const TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: content);
  }
}
