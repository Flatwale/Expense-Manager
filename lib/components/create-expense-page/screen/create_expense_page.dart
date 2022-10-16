import 'package:billsplitter/constants.dart';
import 'package:billsplitter/models/expense_model.dart';
import 'package:billsplitter/models/expense_provider.dart';
import 'package:billsplitter/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String dropdownvalue = 'General';
var items = [
  'General',
  'Foods & Drinks',
  'Travel',
  'Entertainment',
  'Bills & Utilities',
  'Groceries',
  'Fuel',
  'Shopping',
  'Commute',
  'Others'
];

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(130, 180, 130, 10),
              child: TextFormField(
                controller: amountBoxController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '₹ : Amount',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'What was this expense for ? ',
                ),
                controller: expenseNameBoxController,
              ),
            ),
            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            ElevatedButton(
              onPressed: () {
                Expense e = Expense(
                    expenseCategory: ExpenseCategory.food,
                    date: DateTime.now(),
                    primaryUser: original,
                    amount: double.parse(amountBoxController.text),
                    isPersonal: true,
                    expenseName: expenseNameBoxController.text,
                    partnerUser: original);

                Provider.of<ExpenseProvider>(context, listen: false)
                    .addExpense(e);
                setState(() {
                  Provider.of<ExpenseProvider>(context, listen: false)
                      .updateTotal(double.parse(amountBoxController.text));
                });
                print(Provider.of<ExpenseProvider>(context, listen: false)
                    .expenses);
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor)),
              child: Container(
                height: 50,
                width: 200,
                child: const Center(
                    child: Text(
                  "Save Expense",
                  style: TextStyle(fontSize: 25),
                )),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
