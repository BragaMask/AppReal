import 'package:appreal/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: "t1",
        title: "Novo tênis de corrida",
        value: 310.23,
        date: DateTime.now()),
    Transaction(
        id: "t2", title: "Conta de luz", value: 234.52, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.blue,
              child: Text("Gráfico"),
              elevation: 5,
            ),
          ),
          Column(
              children: _transactions.map((tr) {
            return Card(
                child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ), //Espaçamentos das margens do "value"

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ), //Borda do "value"

                  padding: EdgeInsets.all(10),
                  child: Text(tr.value.toString()),
                ), 

                Column(
                  children: [
                    Text(tr.title),
                    Text(tr.date.toString()),
                  ],
                )
              ],
            ));
          }).toList())
        ],
      ),
    );
  }
}
