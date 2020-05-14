import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function onSubmit;


  NewTransaction(this.onSubmit);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _onFormSubmit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || 0 >= enteredAmount) {
      return;
    }

    widget.onSubmit(enteredTitle.toString(), enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => _onFormSubmit(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                onSubmitted: (_) => _onFormSubmit(),
              ),
              FlatButton(
                child: Text("Add Transaction"),
                textColor: Colors.blue,
                onPressed: _onFormSubmit,
              )
            ],
          )),
    );
  }
}
