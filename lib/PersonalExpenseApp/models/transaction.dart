class Transaction {
  String tid;
  String title;
  double amount;
  DateTime date;

  Transaction(
      {required this.tid,
      required this.title,
      required this.amount,
      required this.date});
}
