import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/playing_with_flexible_expand.dart';
import 'widgets/chart.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';

void main() {
  //eta holo device orientation fixe kore dewar jonno
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
          titleLarge: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold),
          labelSmall: const TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData
                .light()
                .textTheme
                .copyWith(
                titleLarge: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
                .titleLarge), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.amber),
      ),
      home: MyHomePage(), //FlexibleandExpand(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int tid = 1;
  final List<Transaction> _userTransactions = [
    //Transaction(
    //    tid: 't1', title: 'New shoes', amount: 60.54, date: DateTime.now()),
    //Transaction(
    //    tid: 't2', title: 'Grocery', amount: 88.53, date: DateTime.now()),
    //Transaction(
    //    tid: 't3', title: 'New Mobile', amount: 70.45, date: DateTime.now()),
  ];

  bool showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount,
      DateTime chosenDate) {
    String tid = 't${this.tid++}';
    final addTx = Transaction(
        tid: tid, title: txTitle, amount: txAmount, date: chosenDate);
    setState(() {
      _userTransactions.add(addTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.tid == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final mediaQuery = MediaQuery.of(context);
    bool isLandScape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Personal Expenses'),
      actions: [
        IconButton(
          onPressed: () {
            _startAddNewTransaction(context);
          },
          icon: const Icon(Icons.add),
        )
      ],
    );


    Widget recentTxWidget({required double wgdRatio}) { return Container(
        height: (mediaQuery.size.height - appBar.preferredSize.height -
            mediaQuery.padding.top) * wgdRatio,
        child: Chart(_recentTransactions));}

    Widget txListWidget (MediaQueryData mediaQuery, AppBar appBar){
      return Container(
      height: (mediaQuery.size.height - appBar.preferredSize.height -
          mediaQuery.padding.top) * 0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    }

    List<Widget> _buildLandScapeContent(double wgdRatio,MediaQueryData mediaQuery,AppBar appBar){
      return[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Show list'),
            Switch.adaptive(
              activeColor:Theme.of(context).accentColor,
              value: showChart,
              onChanged: (val) {
                setState(() {
                  showChart = val;
                });
              },
            )
          ],
        ),
        showChart ? recentTxWidget(wgdRatio: wgdRatio) : txListWidget(mediaQuery,appBar),
      ];
    }

    List<Widget> _buildPortraitContent(double wgdRatio,MediaQueryData mediaQuery,AppBar appBar){
      return[
        recentTxWidget(wgdRatio: wgdRatio),
        txListWidget(mediaQuery, appBar)
      ];
    }

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if(isLandScape) ..._buildLandScapeContent(0.7,mediaQuery,appBar),
            //if(!isLandScape) recentTxWidget(wgdRatio: 0.3),
            //if(!isLandScape) txListWidget,
            if(!isLandScape) ..._buildPortraitContent(0.3,mediaQuery,appBar),
            //if(isLandScape) showChart ? recentTxWidget(wgdRatio: 0.7) : txListWidget,
            //
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Platform.isIOS ? Container(): FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        tooltip: 'Add Transaction',
        child: const Icon(Icons.add),
      ),
    );
  }
}
