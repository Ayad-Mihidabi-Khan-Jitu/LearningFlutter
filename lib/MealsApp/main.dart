import 'package:flutter/material.dart';
import 'package:learning_flutter/MealsApp/screens/categories_screen.dart';
import 'package:learning_flutter/MealsApp/screens/filters_screen.dart';
import 'package:learning_flutter/MealsApp/screens/meals_detail_screen.dart';
import 'package:learning_flutter/MealsApp/screens/tabs_srceen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            displayMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            displayLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            labelSmall: const TextStyle(color: Colors.pink),
            titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      //home: const CategoriesScreen(), //eta holo home page: the starting page of the app
      initialRoute: '/', //default initial route means home page
      routes: {
        '/': (ctx) => TabsScreen(), // eta holo home page defined by '/' notation
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
        MealsDetailScreen.routeName:(ctx) => MealsDetailScreen(),
        FiltersScreen.routeName:(ctx) => FiltersScreen(),
      },
      ///onGenerateRoute : eta route e jodi problem er karone route hoy tahole
      ///ekhane je route ache seta hobe
      //onGenerateRoute: (setting) {
       // print(setting.arguments);
       // if(setting.name == '/category-meals')
       //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
       // else if(setting.name == '/meal-details')
       //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      //},
      ///onUnknownRoute: jodi route and onGenerateRoute kono tai kaj na kore
      ///tahole else er moto last route kore dibe
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder: (ctx) =>  const Text('sorry page could not found'));
      },

    );
  }
}
