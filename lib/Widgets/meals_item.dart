import 'package:flutter/material.dart';
import 'package:meals_flutter_app/Widgets/meal_item_traits.dart';
import 'package:transparent_image/transparent_image.dart';
import '../Modals /meals.dart';
import '../Screens/meals_detailed_screen.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({Key? key, required this.meal,}) : super(key: key);
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) => MealsDetailScreen(meal: meal, )));
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.hardEdge,
        // child: InkWell(
        //   onTap: (){},  //  define function to use this tap  in  ch :-> 162
          child: Stack(
            children: [
              Hero(
                tag:meal.id ,
                child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl)),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow
                              .ellipsis, //... not fitted text look like dots...
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MealItemTraits(
                                  icon: Icons.schedule,
                                  label: "${meal.duration} min"),

                              const SizedBox(
                                width: 12,
                              ),
                              // use getter to uppercase format
                              MealItemTraits(
                                icon: Icons.attach_money_outlined,
                                label: meal.affordability.name[0].toUpperCase() +
                                    meal.affordability.name
                                        .substring(1), // without using getter
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              MealItemTraits(
                                  icon: Icons.work_outline,
                                  label: complexityText),
                            ]),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
    );
  }
}
