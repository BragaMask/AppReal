import 'package:appreal/components/transaction_form.dart';
import 'package:appreal/transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_list.dart';

 
main() => runApp(ExpensesApp());
 
class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});
  final ThemeData tema = ThemeData();
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData //Dados do Tema
      (
        useMaterial3: false,  // Desabilita o uso do Material Design 3
        appBarTheme: const AppBarTheme //Os temas da AppBar
        (
          backgroundColor: Colors.purple, //Cor do fundo
          foregroundColor: Colors.white,  //Cor dos elementos
        ),
        colorScheme: //Esquema de cores para o aplicativo 
        ColorScheme.fromSeed(
          seedColor: Colors.amber, //Gera o esquema de cores
          primary: Colors.purple, //Cor primária
          secondary: Colors.amber, //Cor secundária
        ),
      ),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];
 
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
 
    setState(() {
      _transactions.add(newTransaction);
    });
 
    Navigator.of(context).pop();
  }
 
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}