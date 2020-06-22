import './widgets/chart.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekly Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme:
            AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver{
  final List<Transaction> _userTransactions = [
//     Transaction(
//         id: '101', title: 'Groceries', amount: 25.85, date: DateTime.now(),
//         ),
//     Transaction(
//       id: '109', title: 'Milk', amount: 140.55, date: DateTime.now(),
//       ),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

@override
void initState(){
  WidgetsBinding.instance.addObserver(this);
  super.initState();
}
@override
void didChangeAppLifecycleState(AppLifecycleState state){
  print(state);
}
@override
void dispose(){
  WidgetsBinding.instance.removeObserver(this);
  super.dispose();
}
  void _addNewTransactions(
      String titleText, double amountText, DateTime choosenDate) {
    final transactions = Transaction(
        title: titleText,
        amount: amountText,
        date: choosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(transactions);
    });
  }

  void _addStartNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransactions),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransactions(String transactionId) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == transactionId);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Application'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addStartNewTransactions(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionLists(_userTransactions, _deleteTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addStartNewTransactions(context),
      ),
    );
  }
}
