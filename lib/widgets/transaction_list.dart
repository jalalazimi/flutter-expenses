import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: userTransactions.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/waiting.png'),
                  SizedBox(height: 10,),
                  Text(
                    "Add a new transaction!",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: Theme.of(context).primaryColorDark,
                                width: 1)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userTransactions[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            DateFormat.yMd()
                                .add_Hm()
                                .format(userTransactions[index].date),
                            style: TextStyle(color: Colors.black45),
                          )
                        ],
                      )
                    ],
                  ));
                },
                itemCount: userTransactions.length,
              ));
  }
}
