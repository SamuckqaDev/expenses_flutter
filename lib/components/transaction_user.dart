import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      uuid: const Uuid().v4(),
      title: "new shoes",
      value: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Smartphone",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Food",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Clothes",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Car",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "House",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Bike",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Boat",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Plane",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Train",
      value: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      uuid: const Uuid().v4(),
      title: "Bus",
      value: 999.99,
      date: DateTime.now(),
    ),
  ];

  _doAddNewTransaction(String title, double value) {
    final newTransaction = Transaction(
      uuid: const Uuid().v4(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _doRemoveTransaction(String uuid) {
    setState(() {
      _transactions.removeWhere((tr) => tr.uuid == uuid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsForm(
          onSubmit: _doAddNewTransaction,
        ),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
