import 'package:billsplitter/components/create-expense-page/screen/create_expense_page.dart';
import 'package:billsplitter/components/recent-transactions/split.dart';
import 'package:billsplitter/constants.dart';
import 'package:billsplitter/models/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double totalSpending;
  final List<ChartData> chartData = [
    ChartData('David', 25, Color.fromRGBO(9, 0, 136, 1)),
    ChartData('Steve', 38, Color.fromRGBO(147, 0, 119, 1)),
    ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
    ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
  ];
  @override
  Widget build(BuildContext context) {
    totalSpending =
        Provider.of<ExpenseProvider>(context, listen: true).getTotal;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Expense Manager"),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreateExpensePage()));
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: SfCircularChart(series: <CircularSeries>[
            // Renders doughnut chart
            DoughnutSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ])),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: 300,
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Total Spendings : ",
                          style: bigText,
                        ),
                        Text(
                          "$totalSpending Rs.",
                          // Provider.of<ExpenseProvider>(context)
                          //     .totalExpense
                          //     .toString(),
                          style: bigText.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.w800),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor)),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Split()));
              },
              child: const Text("Show Spendings"))
        ],
      ),
    );
  }
}
