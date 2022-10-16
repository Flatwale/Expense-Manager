import 'package:billsplitter/models/expense_model.dart';
import 'package:billsplitter/models/expense_provider.dart';
import 'package:billsplitter/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateExpensePage extends StatefulWidget {
  const CreateExpensePage({Key? key}) : super(key: key);

  @override
  State<CreateExpensePage> createState() => _CreateExpensePageState();
}

class _CreateExpensePageState extends State<CreateExpensePage> {
  User original = User(email: '', name: ' ', uid: '');
  TextEditingController amountBoxController = TextEditingController();

  TextEditingController expenseNameBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            const Text('Amount'),
            TextFormField(
              controller: amountBoxController,
            ),
            const Text('Name'),
            TextFormField(
              controller: expenseNameBoxController,
            ),
            ElevatedButton(
                onPressed: () {
                  Expense e = Expense(
                      date: DateTime.now(),
                      primaryUser: original,
                      amount: double.parse(amountBoxController.text),
                      isPersonal: true,
                      expenseName: expenseNameBoxController.text,
                      partnerUser: original);

                  Provider.of<ExpenseProvider>(context, listen: false)
                      .addExpense(e);

                  print(Provider.of<ExpenseProvider>(context, listen: false)
                      .expenses);
                },
                child: Text("Click"))
          ],
        ),
      ),
    ));
  }
}
