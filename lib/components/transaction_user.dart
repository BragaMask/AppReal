
import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';
import 'package:appreal/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: "t1",
      title: "Novo tênis de corrida",
      value: 310.23,
      date: DateTime.now()),
    Transaction(
      id: "t2",
      title: "Conta de luz",
      value: 234.52,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newtransaction = Transaction(
        id: "tX",
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newtransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
