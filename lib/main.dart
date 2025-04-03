import 'package:expenses/model/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  final tittleController = TextEditingController(text: '');
  final valueController = TextEditingController(text: '');

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
  ];

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Expenses',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            child: Card(
              color: Colors.purple,
              elevation: 5,
              child: Text(
                "gauge",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Column(children: [
            ...(_transactions.map(
              (tr) => Card(
                  child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'R\$ ${tr.value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        tr.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(DateFormat('dd MMM y').format(tr.date),
                          style: const TextStyle(
                            color: Colors.grey,
                          )),
                    ],
                  )
                ],
              )),
            )),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: tittleController,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'value(R\$)',
                      ),
                      controller: valueController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple,
                          ),
                          child: TextButton(
                              onPressed: () {
                                if (kDebugMode) {
                                  print({
                                    'title': tittleController.text,
                                    'value': valueController.text,
                                  });
                                }
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: const Text('Add Transaction')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
