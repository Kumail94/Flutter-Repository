import '../widgets/chat_bar.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions) {}
  List<Map<String, Object>> get getTransactionListValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.day == weekDay.month &&
            recentTransactions[i].date.day == weekDay.year) {
          totalSum = totalSum + recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get _totalWeekSpending{
   return getTransactionListValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getTransactionListValues.map((trans) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  trans['day'],
                  trans['amount'],
                  _totalWeekSpending == 0.0
                      ? 0.0
                      : (trans['amount'] as double) / _totalWeekSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
