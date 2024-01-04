import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_flutter_app/providers/favorite_provider.dart';
import '../Modals /meals.dart';

class MealsDetailScreen extends ConsumerWidget {
  const MealsDetailScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
final favoriteMeal = ref.watch(favoriteMealsProvider);
final isFavorite = favoriteMeal.contains(meal);

    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
             final wasAdded =  ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavorite(meal);
                ScaffoldMessenger.of(context).clearSnackBars(); // if any  show
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    wasAdded ? "Meal added as a favorite." : "Meal removed." ,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  duration: const Duration(seconds: 3),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ));
              },
              icon:Icon(Icons.favorite  ,color: isFavorite ? Colors.pink:Colors.white,size: 30,),
            ),
          ],
          title: Text(
            meal.title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                    meal.imageUrl,
                    height: 300,
                    fit: BoxFit.cover,
                    width: double.infinity,
                   ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "> Ingredients ",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 35, color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 8,
              ),
              for (final ingredients in meal.ingredients)
                Text(
                  " • $ingredients",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 18),
                ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "> Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 35,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              for (final step in meal.steps)
                Text(
                  " • $step",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 25),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
