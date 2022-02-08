import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

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
    return userTransactions.isNotEmpty
        ? ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text('₹${userTransactions[index].amount}'),
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    userTransactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(userTransactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'),
                          style: TextButton.styleFrom(
                              primary: Theme.of(context).errorColor),
                          onPressed: () =>
                              deleteTransaction(userTransactions[index].id),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTransaction(userTransactions[index].id),
                        ),
                ),
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
