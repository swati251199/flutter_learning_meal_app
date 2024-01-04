/// tab screen without using provider
/// in this screen we manage state by cross the function between classes
///

// import 'package:flutter/material.dart';
// import 'package:meals_flutter_app/Data/dummy_data.dart';
// import 'package:meals_flutter_app/Screens/meals_screen.dart';
// import 'package:meals_flutter_app/Widgets/main_drawer.dart';
// import '../Modals /meals.dart';
// import 'catagories_screen.dart';
// import 'filters.dart';
//
// const KInitialFilters ={
//   Filters.glutenFree : false,
//   Filters.lactoseFree :false,
//   Filters.vegetarian:false,
//   Filters.vegan:false,
// };
//
//
// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key? key}) : super(key: key);
//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }
//
// class _TabsScreenState extends State<TabsScreen> {
//   var _selectedPageIndex = 0;
//   final List<Meal> favoriteMeals = [];
//    Map<Filters,bool> _selectedFilters = KInitialFilters;
//
//   void showInfoMessage(String msg) {
//     ScaffoldMessenger.of(context).clearSnackBars(); // if any  show
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(
//         msg,
//         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
//       ),
//       duration: const Duration(seconds: 3),
//       backgroundColor: Theme.of(context).colorScheme.error,
//     ));
//   }
//
//   @override
//
//
//   void toggleMealFavoriteStatus(Meal meal) {
//     final isExisting = favoriteMeals.contains(meal);
//     if (isExisting) {
//       setState(() {
//         favoriteMeals.remove(meal);
//         showInfoMessage("Meal is no longer as favorite .");
//       });
//     } else {
//       setState(() {
//         favoriteMeals.add(meal);
//         showInfoMessage("Meal is marked as favorite . ");
//       });
//     }
//   }
//   @override
//   // void initState() {
//   //   super.initState();
//   //   //isExisting = favoriteMeals.contains(meal) ;
//   //   favoriteMeals = isExisting!;
//   // }
//
//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }
//
//   void setScreen(String identifier) async {
//     Navigator.pop(context);
//     if (identifier == 'filters') {
//       final result = await Navigator.push<Map<Filters, bool>>(context,
//           MaterialPageRoute(builder: (context) => FiltersScreen(currentFilters: _selectedFilters,)));
//
//       setState(() {
//
//         _selectedFilters = result ??  KInitialFilters;  // if result is null then this value will behold
//       });
//
//       print(result);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final availableMeals = dummyMeals.where((element){
//       if( _selectedFilters[Filters.glutenFree]! && element.isGlutenFree){
//         return false;
//       }
//       if( _selectedFilters[Filters.lactoseFree]! && element.isLactoseFree){
//         return false;
//       }
//       if( _selectedFilters[Filters.vegetarian]! && element.isVegetarian){
//         return false;
//       }
//       if( _selectedFilters[Filters.vegetarian]! && element.isVegetarian){
//         return false;
//     }
//     return true;
//     }).toList();
//     var activePageTitle = "Categories";
//     Widget activeScreen = CategoriesScreen(
//       ontoggleFavorite: toggleMealFavoriteStatus,
//       availableMealsByFilter: availableMeals ,
//     );
//     if (_selectedPageIndex == 1) {
//       activeScreen = MealScreen(
//         // title: "Your Favorites", /// now its optional
//         meals: favoriteMeals,
//         ontoggleFavorite: toggleMealFavoriteStatus,
//       );
//       activePageTitle = "Your Favorites";
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(activePageTitle),
//       ),
//       body: activeScreen,
//       drawer: MainDrawer(
//         omSelectScreen: setScreen,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedPageIndex,
//         //    backgroundColor: Theme.of(context).colorScheme.onSecondary,
//         onTap: _selectPage,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.set_meal), label: "Categories"),
//           BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
//         ],
//       ),
//     );
//   }
// }
