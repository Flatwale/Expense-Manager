import 'package:billsplitter/components/create-expense-page/screen/create_expense_page.dart';
import 'package:billsplitter/components/home-page/screens/homepage.dart';
import 'package:billsplitter/models/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ExpenseProvider(),
        )
      ],
      child: Consumer<ExpenseProvider>(
        builder: (context, value, child) {
          return const MaterialApp(
            home: HomePage(),
          );
        },
      ),
    );
  }
}
