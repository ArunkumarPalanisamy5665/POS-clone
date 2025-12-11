import 'package:flutter/material.dart';

class BudgetModel {
  final List<BudgetList> budgetList;

  BudgetModel({required this.budgetList});
}

class BudgetList {
  final TextEditingController revenueTitleCtrl;
  final TextEditingController revenueAmountCtrl;
  final String? revenueTitle;
  final String? revenueAmount;
  BudgetList( { this.revenueTitle = "revenue_title" ,  this.revenueAmount = "revenue_amount",required this.revenueTitleCtrl,  required this.revenueAmountCtrl,});
}
