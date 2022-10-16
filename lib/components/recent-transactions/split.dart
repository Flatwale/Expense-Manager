import 'package:billsplitter/constants.dart';
import 'package:billsplitter/models/expense_model.dart';
import 'package:billsplitter/models/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Split extends StatefulWidget {
  const Split({Key? key}) : super(key: key);

  @override
  State<Split> createState() => _SplitState();
}

class _SplitState extends State<Split> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("Split"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => TransactionDetails(
            expense: Provider.of<ExpenseProvider>(context).expenses[index],
          ),
          itemCount: Provider.of<ExpenseProvider>(context).expenses.length,
        ));
  }
}

class TransactionDetails extends StatelessWidget {
  TransactionDetails({required this.expense, Key? key}) : super(key: key);
  Expense expense;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.tealAccent.shade100,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 80,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.calendar_month_rounded),
                  Text(
                    "15 Oct",
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.expenseName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Rs.${expense.amount}"),
                  // Text("Paid by whom"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("You will pay/get"),
                ],
              ),
            ],
          ),
        ));
  }
}
