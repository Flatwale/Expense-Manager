import 'package:billsplitter/components/create-expense-page/screen/create_expense_page.dart';
import 'package:billsplitter/components/recent-transactions/split.dart';
import 'package:billsplitter/constants.dart';
import 'package:billsplitter/models/expense_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double totalSpending;
  @override
  Widget build(BuildContext context) {
    totalSpending = 6000;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreateExpensePage()));
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Total Spendings : ",
                          style: bigText,
                        ),
                        Text(
                          "6000",
                          style: bigText.copyWith(color: Colors.grey),
                        )
                      ],
                    )
                  ]),
                ),
                height: 300,
                width: 450,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Split()));
              },
              child: Text("Show Recent Transaction"))
        ],
      ),
    );
  }
}
