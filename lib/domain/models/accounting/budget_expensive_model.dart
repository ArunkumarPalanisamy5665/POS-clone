import 'package:flutter/material.dart';

class BudgetExpenseModel {
  final List<BudgetExpenseList> budgetExpenseList;

  BudgetExpenseModel({required this.budgetExpenseList});
}

class BudgetExpenseList {
  final TextEditingController expenseTitleCtrl;
  final TextEditingController expenseAmountCtrl;
  final String? expenseTitle;
  final String? expenseAmount;
  BudgetExpenseList( { this.expenseTitle = "expenses_title" ,  this.expenseAmount = "expenses_amount",required this.expenseTitleCtrl,  required this.expenseAmountCtrl,});
}
