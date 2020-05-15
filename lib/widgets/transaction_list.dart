import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: userTransactions.isEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/waiting.png'),
            SizedBox(
              height: 10,
            ),
            Text(
              "Add a new transaction!",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5,
            )
          ],
        )
            : ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      child: Text(
                          '\$${userTransactions[index].amount.toStringAsFixed(
                              2)}'),
                    ),
                  ),
                ),
                title: Text(userTransactions[index].title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text(
                    DateFormat.yMd()
                        .add_Hm()
                        .format(userTransactions[index].date),
                    style: TextStyle(fontSize: 14)),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.redAccent ,
                  onPressed: () {
                    deleteTransaction(userTransactions[index].id);
                  },
                ),
              ),
            );
          },
          itemCount: userTransactions.length,
        ));
  }
}
