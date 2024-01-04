/// old code when manage state locally
/// now manage state using  provider in new filter Screen
/// so it is commented to differentiate  when we did without provider


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../providers/filters_provider.dart';
//
//
// class FiltersScreen extends ConsumerStatefulWidget {
//   const FiltersScreen({Key? key, }) : super(key: key);
// //final Map<Filters,bool> currentFilters; /// now using provider
//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }
//
// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var glutenFreeFilterSet  = false;
//   var lactoseFreeFilterSet  = false;
//   var veganFilterSet  = false;
//   var vegetarianFilterSet  = false;
// @override
//   void initState() {
//     super.initState();
//     final activeFilters = ref.read(filtersProvider);
//     glutenFreeFilterSet = activeFilters[Filters.glutenFree]!;
//     lactoseFreeFilterSet= activeFilters[Filters.lactoseFree]!;
//     vegetarianFilterSet =activeFilters[Filters.vegetarian]!;
//     veganFilterSet =activeFilters[Filters.vegan]!;
//    print(activeFilters);
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Filters"),
//       ),
//       body: WillPopScope(
//         onWillPop: ()  async{
//           ref.read(filtersProvider.notifier).setFilter(
//               {
//                 Filters.glutenFree : glutenFreeFilterSet,
//                 Filters.lactoseFree :lactoseFreeFilterSet,
//                 Filters.vegan :veganFilterSet,
//                 Filters.vegetarian: vegetarianFilterSet,
//               }
//           );
//       // Navigator.of(context).pop({
//       //   Filters.glutenFree : glutenFreeFilterSet,
//       //   Filters.lactoseFree :lactoseFreeFilterSet,
//       //   Filters.vegan :veganFilterSet,
//       //   Filters.vegetarian: vegetarianFilterSet,
//       //   });
//       return true;
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: glutenFreeFilterSet ,
//               onChanged: (isChecked){
//                 setState(() {
//                   glutenFreeFilterSet = isChecked;
//                 });
//
//               },
//               title: Text(
//                 "Gluten-Free",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 'Only include gluten-free meals',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onBackground),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//             ),
//             SwitchListTile(
//               value:lactoseFreeFilterSet ,
//               onChanged: (isChecked){
//                 setState(() {
//                   lactoseFreeFilterSet = isChecked;
//                 });
//
//               },
//               title: Text(
//                 "Lactose-Free",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 'Only include Lactose-free meals',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onBackground),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//             ),SwitchListTile(
//               value:    veganFilterSet ,
//               onChanged: (isChecked){
//                 setState(() {
//                   veganFilterSet= isChecked;
//                 });
//
//               },
//               title: Text(
//                 "Vegan",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 'Only include vegan meals',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onBackground),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding:const EdgeInsets.symmetric(horizontal: 20),
//             ),SwitchListTile(
//               value: vegetarianFilterSet  ,
//               onChanged: (isChecked){
//                 setState(() {
//                   vegetarianFilterSet  = isChecked;
//                 });
//
//               },
//               title: Text(
//                 "Vegetarian",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 'Only include vegetarian meals',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onBackground),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
