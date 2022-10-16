import 'package:billsplitter/models/expense_model.dart';
import 'package:flutter/cupertino.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> expenses = [];

  double _totalExpense = 0;

  void updateTotal(double amount) {
    _totalExpense = _totalExpense + amount;
    notifyListeners();
  }

  double get getTotal {
    return _totalExpense;
  }

  void loadExpenses() {
    //backend se expenses retrieve
  }

  void addExpense(Expense expense) {
    expenses.add(expense);
    notifyListeners();
  }
}
