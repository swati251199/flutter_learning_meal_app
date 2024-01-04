import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Modals /meals.dart';
class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);
 bool toggleMealFavorite(Meal meal){
 final mealIsFavorite = state.contains(meal);
 print("Favnotofier $mealIsFavorite");
 if(mealIsFavorite){
   state = state.where((m) => m.id != meal.id).toList();
   return false;
 }else{
   state = [...state, meal];
   return true;
 }
 }
}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) => FavoriteMealsNotifier());