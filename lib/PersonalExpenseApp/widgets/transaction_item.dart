import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.userTransaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTx;

  @override
  TransactionItemState createState() {
    return TransactionItemState();
  }
}

class TransactionItemState extends State<TransactionItem>{
  late Color _bgColor;

  @override
  void initState(){
    const availableColors = [Colors.red,Colors.black,Colors.blue,Colors.purple];
    _bgColor = availableColors[Random().nextInt(max(0,4))];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: FittedBox(
              child: Text('\$${widget.userTransaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.userTransaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
            DateFormat.yMMMEd().format(widget.userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
          //color:Theme.of(context).accentColor,
          //textColor: Theme.of(context).errorColor,
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          onPressed: () =>
              widget.deleteTx(widget.userTransaction.tid),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () =>
              widget.deleteTx(widget.userTransaction.tid),
        ),
      ),
    );
  }
}
