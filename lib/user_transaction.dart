import 'package:expenseplaner/models/transaction.dart';
import 'package:expenseplaner/new_transaction.dart';
import 'package:expenseplaner/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget{
  @override
  _UserTransactionState createState() {
      return _UserTransactionState();
  }
  
}
class _UserTransactionState extends State<UserTransaction>{
  final List<Transaction> _userTransaction = [

    Transaction(id: "t1", title: "New Shoes", amount:69.20, date:DateTime.now()),
    Transaction(id: "t1", title: "Weekely Groceris", amount:88.20, date:DateTime.now())

  ];

  void _addNewTransaction(String txtitle,double txamount){
      final newTx =Transaction(
          title:txtitle,
          amount:txamount,
          date:DateTime.now(),
          id:DateTime.now().toString()
      );
      setState(() {
        _userTransaction.add(newTx);
      });
  }

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
         // NewTransaction(_addNewTransaction),
          TransactionList(_userTransaction),
        ],
      );
  }
  
} 