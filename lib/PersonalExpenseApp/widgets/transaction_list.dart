import 'package:flutter/material.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTx;
  const TransactionList(this.userTransaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return userTransaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: [
              Text(
                'No transaction added yet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset('assets/images/waiting.png'),
              )
            ]);
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(key: Key(userTransaction[index].tid), userTransaction: userTransaction[index], deleteTx: deleteTx);
            },
            itemCount: userTransaction.length,
          );
  }
}

/*
///View-3
import 'package:flutter/material.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTx;
  const TransactionList(this.userTransaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return userTransaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: [
              Text(
                'No transaction added yet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset('assets/images/waiting.png'),
              )
            ]);
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(key: Key(userTransaction[index].tid), userTransaction: userTransaction[index], deleteTx: deleteTx);
            },
            itemCount: userTransaction.length,
          );
  }
}
*/


/*
///View-2
///ekhane je transaction list seta user defined list tile
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350,
      child: userTransactions.isEmpty
          ? Column(children: [
              Text(
                'No transaction added yet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20,),
              Container(
                height: 200,
                child: Image.asset('assets/images/waiting.png'),
              )
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 3,
                              style: BorderStyle.solid),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userTransactions[index].title,
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(
                            DateFormat().format(userTransactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
*/

/*
///View-1
/// list ta Simply Column ar singlescrollvew er maddhome
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: userTransactions.map((tx) {
            return Card(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.teal,
                          width: 3,
                          style: BorderStyle.solid),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
*/
