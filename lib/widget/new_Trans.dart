import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTrans extends StatefulWidget {
  final Function addTx;

  NewTrans(this.addTx);

  @override
  State<NewTrans> createState() => _NewTransState();
}

class _NewTransState extends State<NewTrans> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
DateTime? _selectedDate;
  void submitData() {

    if(amountController.text.isEmpty){
return;
    }
    final titlename = titleController.text;
    final amounten = double.parse(amountController.text);
    if (titlename.isEmpty || amounten <= 0 || _selectedDate==null) {
      return;
    }

    widget.addTx(
      titlename,
      amounten,
      _selectedDate
    );
    Navigator.of(context).pop();
  }

  void _selectDatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1999),
            lastDate: DateTime.now())
        .then((pickdate) {
      if (pickdate == null) {
        return;
      }
      _selectedDate = pickdate as DateTime;
      setState(() {
        _selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(top:10,left:10, right: 10,bottom: MediaQuery.of(context).viewInsets.bottom +10),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title here"),
                onSubmitted: (_) => submitData,
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Amount here"),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData,
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                     Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : DateFormat.yMd().format(_selectedDate!),
                    ),
                    RaisedButton(
                        child: Text("Select Date",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        textColor: Colors.purpleAccent,
                        color: Colors.white,
                        onPressed: _selectDatepicker)
                  ],
                ),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: submitData,
              ),
            ],
          ),
        ),
      );

  }
}
