import 'package:billsplitter/models/expense_model.dart';
import 'package:flutter/cupertino.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> expenses = [];

  void loadExpenses() {
    //backend se expenses retrieve
  }

  void addExpense(Expense expense) {
    expenses.add(expense);
    ChangeNotifier();
  }
}
