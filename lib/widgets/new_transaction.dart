import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function onSubmit;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.onSubmit);

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
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              FlatButton(
                child: Text("Add Transaction"),
                textColor: Colors.blue,
                onPressed: () {
                  onSubmit(titleController.text.toString(),
                      double.parse(amountController.text));
                },
              )
            ],
          )),
    );
  }
}
