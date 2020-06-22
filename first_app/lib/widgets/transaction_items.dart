import 'dart:math';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItems extends StatefulWidget {
  const TransactionItems({
    Key key,
    @required this.userTransactions,
    @required this.deleteTransactions,
  }): super(key: key);

  final Transaction userTransactions;
  final Function deleteTransactions;

  @override
  _TransactionItemsState createState() => _TransactionItemsState();
}

class _TransactionItemsState extends State<TransactionItems> {
  Color _bgColor;
  @override
  void initState(){
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.purple
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.userTransactions.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.userTransactions.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.userTransactions.date),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTransactions(widget.userTransactions.id),
        ),
      ),
    );
  }
}
