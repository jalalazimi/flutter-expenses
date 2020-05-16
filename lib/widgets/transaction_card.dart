import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction userTransaction;
  final Function deleteTransaction;

  TransactionCard(this.userTransaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                  '\$${userTransaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(userTransaction.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Text(
            DateFormat.yMd().add_Hm().format(userTransaction.date),
            style: TextStyle(fontSize: 14)),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.redAccent,
          onPressed: () {
            deleteTransaction(userTransaction.id);
          },
        ),
      ),
    );
  }
}
