import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_flutter_app/Screens/filters.dart';
import 'package:meals_flutter_app/providers/meals_provider.dart';
enum Filters {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian

}
class FilterNotifier extends StateNotifier<Map<Filters,bool>>{
  FilterNotifier() : super({
    Filters.glutenFree : false,
    Filters.lactoseFree : false,
    Filters.vegetarian: false,
    Filters.vegan : false,
  });
  void setFilters(Map<Filters,bool> chosenFilters){
    state = chosenFilters;
  }


void setFilter(Filters filter ,bool isActive ){
  state ={
    ...state,
    filter : isActive,
  };
}

}
final filtersProvider = StateNotifierProvider<FilterNotifier,Map<Filters,bool>>((ref) => FilterNotifier() );

final filteredMealsProvider = Provider((ref) {
  final meals =ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
 return meals.where((element){

return (element.isVegan == activeFilters[Filters.vegan] || element.isVegetarian == activeFilters[Filters.vegetarian] || element.isGlutenFree == activeFilters[Filters.glutenFree] || element.isLactoseFree == activeFilters[Filters.lactoseFree]);
    // if(activeFilters[Filters.glutenFree]! && element.isGlutenFree){
    //   return false;
    // }
    // if( activeFilters[Filters.lactoseFree]! && element.isLactoseFree){
    //   return false;
    // }
    // if( activeFilters[Filters.vegetarian]! && element.isVegetarian){
    //   return false;
    // }
    // if(activeFilters[Filters.vegetarian]! && element.isVegetarian){
    //   return false;
    // }

  }).toList();

});