import '../widgets/transaction_items.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionLists extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransactions;
  TransactionLists(this.userTransactions, this.deleteTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No! Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.network(
                    'https://clipartstation.com/wp-content/uploads/2017/11/sleep-clipart-zzz-3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView(
            children: userTransactions
            .map((tx) => TransactionItems(
            key: ValueKey(tx.id),
              userTransactions:tx,
             deleteTransactions : deleteTransactions,
          )).toList(),
    ),
    );
  }
}
