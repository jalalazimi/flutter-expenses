import 'package:flutter/material.dart';
import './transaction_card.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    final isPortrate =
        MediaQuery.of(context).orientation != Orientation.landscape;
    return Container(
        child: userTransactions.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (isPortrate) Image.asset('assets/images/waiting.png'),
                  if (isPortrate)
                    const SizedBox(
                      height: 10,
                    ),
                  Text(
                    "Add a new transaction!",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionCard(
                    userTransactions[index],
                    deleteTransaction,
                  );
                },
                itemCount: userTransactions.length,
              ));
  }
}
