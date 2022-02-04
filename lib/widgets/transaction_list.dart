import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

@immutable
class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransactions.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '₹ ${userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            userTransactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(userTransactions[index].date),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                );
              },
              itemCount: userTransactions.length,
            )
          : Column(
              children: [
                Text(
                  'No Transaction Found!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  padding: const EdgeInsets.only(top: 20),
                ),
              ],
            ),
    );
  }
}
