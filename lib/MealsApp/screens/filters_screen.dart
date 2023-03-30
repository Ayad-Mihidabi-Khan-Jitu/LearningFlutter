import 'package:flutter/material.dart';
import 'package:learning_flutter/MealsApp/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Center(child: Text('HERE WE GO.')) ,
        ],
      ),
    );
  }
}
