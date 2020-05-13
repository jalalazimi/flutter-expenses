import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New TV', amount: 678.45, date: DateTime.now()),
    Transaction(id: 't2', title: 'Pizza', amount: 12.90, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _userTransactions.map((tx) {
      return Card(
          child: Row(
        children: <Widget>[
          Container(
            child: Text(
              '\$${tx.amount.toString()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue),
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tx.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                DateFormat.yMd().add_Hm().format(tx.date),
                style: TextStyle(color: Colors.black45),
              )
            ],
          )
        ],
      ));
    }).toList());
  }
}
