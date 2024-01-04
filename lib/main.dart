import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Data/dummy_data.dart';
import 'Screens/catagories_screen.dart';
import 'Screens/meals_screen.dart';
import 'Screens/tabs_screen.dart';
import 'Screens/tabs_screen_afterprovider.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
  // textTheme: GoogleFonts.aBeeZeeTextTheme();
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.pink, brightness: Brightness.dark
         ),
);

void main() {
  runApp( const ProviderScope
    (child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),

      //const CategoriesScreen(),
      //  home: //const MealScreen(title: 'Some Category',meals:dummyMeals,)
    );
  }
}
