class Transaction {
  final String _uuid;
  final String _title;
  final double _value;
  final DateTime _date;

  Transaction({
    required String uuid,
    required String title,
    required double value,
    required DateTime date,
  })  : _uuid = uuid,
        _title = title,
        _value = value,
        _date = date;

  String get uuid => _uuid;
  String get title => _title;
  double get value => _value;
  DateTime get date => _date;

  @override
  String toString() {
    return 'Transaction{uuid: $_uuid, title: $_title, value: $_value, date: $_date}';
  }
}
