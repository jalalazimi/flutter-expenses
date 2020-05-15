import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onSubmit;

  NewTransaction(this.onSubmit);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _date = DateTime.now();

  void _onFormSubmit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || 0 >= enteredAmount) {
      return;
    }

    widget.onSubmit(enteredTitle.toString(), enteredAmount, _date);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedData) {
      if (pickedData != null) {
        _date = pickedData;
      }
    });
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
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "Date: ${DateFormat.yMd().format(_date)}",
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColorDark,
                      onPressed: _presentDatePicker,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  child: Text(
                    "Add Transaction",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  onPressed: _onFormSubmit,
                ),
              )
            ],
          )),
    );
  }
}
