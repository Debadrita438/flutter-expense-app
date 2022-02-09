import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

@immutable
class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  const TransactionList({
    Key? key,
    required this.userTransactions,
    required this.deleteTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build() transaction list');
    return userTransactions.isNotEmpty
        ? ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                userTransaction: userTransactions[index],
                deleteTransaction: deleteTransaction,
              );
            },
            itemCount: userTransactions.length,
          )
        : LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transaction Found!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  padding: const EdgeInsets.only(top: 20),
                ),
              ],
            );
          });
  }
}
