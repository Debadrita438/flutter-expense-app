import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ExpenseApp(),
    );
  }
}

class ExpenseApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'My shoe', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'My pc', amount: 1600.00, date: DateTime.now()),
  ];
  ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART!'),
              elevation: 5,
              color: Colors.blue,
            ),
          ),
          Column(
              children: transactions.map((transaction) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '₹ ${transaction.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        transaction.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transaction.date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
