class TransactionModel {
  TransactionModel({
    required this.fullName,
    required this.date,
    required this.amount,
    required this.isProfit,
  });

  String fullName;
  String date;
  String amount;
  bool isProfit;
}

List<TransactionModel> transactionHistory = [
  TransactionModel(
    fullName: "Robert Albert",
    date: "24 Feb 2022",
    amount: "320",
    isProfit: false,
  ),
  TransactionModel(
    fullName: "Robert Albert",
    date: "24 Feb 2022",
    amount: "320",
    isProfit: true,
  ),
  TransactionModel(
    fullName: "Robert Albert",
    date: "24 Feb 2022",
    amount: "320",
    isProfit: true,
  ),
  TransactionModel(
    fullName: "Robert Albert",
    date: "24 Feb 2022",
    amount: "320",
    isProfit: true,
  ),
  TransactionModel(
    fullName: "Robert Albert",
    date: "24 Feb 2022",
    amount: "320",
    isProfit: false,
  ),
  TransactionModel(
    fullName: "Robert Albert",
    date: "24 Feb 2022",
    amount: "320",
    isProfit: false,
  ),
  TransactionModel(
    fullName: "Robert Albert",
    date: "24 Feb 2022",
    amount: "320",
    isProfit: false,
  ),
];
