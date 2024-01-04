import 'package:flutter/material.dart';
import 'package:meals_flutter_app/Data/dummy_data.dart';
import 'package:meals_flutter_app/Screens/meals_screen.dart';
import 'package:meals_flutter_app/Widgets/main_drawer.dart';
import 'package:meals_flutter_app/providers/meals_provider.dart';
import '../Modals /meals.dart';
import '../providers/filters_provider.dart';
import 'catagories_screen.dart';
import 'filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_flutter_app/providers/favorite_provider.dart';
import 'filter_statemanage_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _selectedPageIndex = 0;

  //final List<Meal> favoriteMeals = [];
  //Map<Filters,bool> _selectedFilters = KInitialFilters;  no use now after provider we will get from there

  @override
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.push<Map<Filters, bool>>(
          context, MaterialPageRoute(builder: (context) => const FiltersScreen()));

      print(" TabsScreen $result");
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final meals =  ref.watch(mealsProvider);
    // //get data using providers
    //  final activeFilters = ref.watch(filtersProvider);
    // final dummydata = ref.watch(mealsProvider);
    final availableMeals = ref.watch(filteredMealsProvider);
    var activePageTitle = "Categories";
    Widget activeScreen = CategoriesScreen(
      // availableMealsByFilter : availableMeals,
      availableMealsByFilter: availableMeals,
    );
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activeScreen = MealScreen(
        // title: "Your Favorites", /// now its optional
        meals: favoriteMeals,
      );
      activePageTitle = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activeScreen,
      drawer: MainDrawer(
        omSelectScreen: setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        //    backgroundColor: Theme.of(context).colorScheme.onSecondary,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
