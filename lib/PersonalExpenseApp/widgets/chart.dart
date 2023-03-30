import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_flutter/PersonalExpenseApp/widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      var weekday = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          totalAmount = totalAmount + recentTransaction[i].amount;
        }
      }

      //print('Day ${DateFormat.E().format(weekday)} : $totalAmount Dollar');

      return {
        'day': DateFormat.E().format(weekday).substring(0, 2),
        'amount': totalAmount
      };
    }).reversed.toList();//eta reverse korsi jate today ta last e thake
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + double.parse(item['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(groupedTransactionValues);
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 6,
      child: Padding(padding: const EdgeInsets.all(10),child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                data['day'].toString(),
                double.parse(data['amount'].toString()),
                maxSpending == 0.0
                    ? 0.0
                    : double.parse(data['amount'].toString()) / maxSpending),
          );
        }).toList(),
      ),)
    );
  }
}
