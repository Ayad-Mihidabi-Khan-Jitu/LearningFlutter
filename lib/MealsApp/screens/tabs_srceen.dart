///Bottom navigation
//Mechanism: BottomNavigationBarItem() er shongkhar opor base kore
//index toiri hoy. orthat jetar opor tap korbo setar jonno akta index
//create hoy. tarpor setai page er index hisebe kaj kore
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '/MealsApp/screens/categories_screen.dart';
import '/MealsApp/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {'page': const CategoriesScreen(), 'title': 'Category'},
    {'page': const FavoritesScreen(), 'title': 'My Favorite'}
  ];

  int selectedPageIndex = 0;

  selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'] as String),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        onTap: selectPage,
        items: const [
          //index 0
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          //index 1
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

/*
///eta holo AppBar er top navigation bar
import 'package:flutter/material.dart';
import '/MealsApp/screens/categories_screen.dart';
import '/MealsApp/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.category), text: 'Categories'),
            Tab(icon: Icon(Icons.star), text: 'Favorites'),
          ]),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen(),
        ]),
      ),
    );
  }
}
 */
