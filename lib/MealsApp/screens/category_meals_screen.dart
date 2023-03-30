import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '/MealsApp/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  ///Constructor ta chilo Category Screen theke data anar jonno jeta constructor er maddhome pass hoye chilo
  //final String categoryId;
  //final String categoryTitle;
  //final Color categoryColor;
  //const CategoryMealsScreen(this.categoryId, this.categoryTitle, this.categoryColor);

  static const routeName = '/category-meals'; //ai page er route name

  @override
  Widget build(BuildContext context) {
    ///data antesi using namedRoute
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'] as String;
    final Color categoryColor = routeArgs['color'] as Color;
    final categoriesMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      //backgroundColor: categoryColor.withGreen(200).withBlue(200).withRed(200),
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoriesMeals[index].id,
              title: categoriesMeals[index].title,
              imageUrl: categoriesMeals[index].imageUrl,
              affordability: categoriesMeals[index].affordability,
              complexity: categoriesMeals[index].complexity,
              duration: categoriesMeals[index].duration);
        },
        itemCount: categoriesMeals.length,
      ),
    );
  }
}
