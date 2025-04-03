import 'package:flutter/material.dart';

class TransactionsForm extends StatelessWidget {
  final tittleController = TextEditingController(text: '');
  final valueController = TextEditingController(text: '');

  final Function(String, double) onSubmit;

  TransactionsForm({super.key, required this.onSubmit});

  _doSubmitForm() {
    final title = tittleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

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
                onSubmitted: (_) => _doSubmitForm(),
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                controller: tittleController,
              ),
              TextField(
                onSubmitted: (_) => _doSubmitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
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
                          _doSubmitForm();
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
