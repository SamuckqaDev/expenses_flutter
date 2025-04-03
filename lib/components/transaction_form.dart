import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransactionsForm extends StatelessWidget {
  final tittleController = TextEditingController(text: '');
  final valueController = TextEditingController(text: '');

  final Function(String, double) onSubmit;

  TransactionsForm({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                          final String title = tittleController.text;
                          final double? value =
                              double.tryParse(valueController.text);

                          if (title.isEmpty || value == null) {
                            return;
                          }

                          onSubmit(title, value);
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: const Text('Add Transaction')),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}
