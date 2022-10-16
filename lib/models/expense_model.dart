import 'package:billsplitter/models/user_model.dart';

class Expense {
  DateTime date;
  User primaryUser;
  String expenseName;
  double amount;
  bool isPersonal;
  User partnerUser = User(email: '', name: '', uid: '');

  Expense(
      {required this.date,
      required this.primaryUser,
      required this.amount,
      required this.expenseName,
      required this.isPersonal,
      required this.partnerUser});
}
