import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.omSelectScreen}) : super(key: key);
 final  void Function(String identifier ) omSelectScreen;

  @override
  Widget build(BuildContext context) {
    return  Drawer(
    child: Column(
      children: [
        DrawerHeader(
            decoration:  BoxDecoration(
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            child: Row(
              children: [
                const Icon(Icons.fastfood,size: 45,),
                const SizedBox(width: 12,),
                Text("Coming Up !!!",style:Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                )),
              ],
            ) ),
         ListTile(
          leading:  Icon(Icons.restaurant,size: 30, color:Theme.of(context).colorScheme.onBackground ,),
          title: Text("Meals",style:  Theme.of(context).textTheme.titleLarge!.copyWith(color:  Theme.of(context).colorScheme.onBackground,fontSize: 24),),
          onTap: (){
            omSelectScreen("meals");
          },
        ),
        ListTile(
          leading:  Icon(Icons.settings,size: 30, color:Theme.of(context).colorScheme.onBackground ,),
          title: Text("Filters",style:  Theme.of(context).textTheme.titleLarge!.copyWith(color:  Theme.of(context).colorScheme.onBackground,fontSize: 24),),
          onTap: (){
            omSelectScreen("filters");
          },
        ),
      ],
    ),
    );
  }
}
