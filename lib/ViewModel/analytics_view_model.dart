import 'package:analytics_ui/Constants/color_constant.dart';
import 'package:analytics_ui/Constants/strings_constatns.dart';
import 'package:analytics_ui/Model/analytics_category_model.dart';
import 'package:analytics_ui/Model/payment_mode_model.dart';
import 'package:analytics_ui/Model/radial_chart_data_model.dart';
import 'package:analytics_ui/Model/task_model.dart';
import 'package:analytics_ui/Model/top_selling_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsViewModel {
  final RxList<AnalyticsCategoryModel> _categoryList = RxList.empty(growable: true);
  final RxList<PaymentModeModel> _paymentTransaction = RxList.empty(growable: true);
  final RxList<TaskModel> _taskList = RxList.empty(growable: true);
  final RxList<TopSellingCategoryModel> _topSellingCategory = RxList.empty(growable: true);

  RxList<AnalyticsCategoryModel> get categoryList => _categoryList;
  RxList<PaymentModeModel> get paymentTransaction => _paymentTransaction;
  RxList<TaskModel> get taskList => _taskList;
  RxList<TopSellingCategoryModel> get topSellingCategory => _topSellingCategory;


  final List<RadialChartDataModel> chartData = [
    RadialChartDataModel(title: "Others",percentage:52,color: ColorConstants.orderColor01),
    RadialChartDataModel(title: "Drinks",percentage:85,color: ColorConstants.orderColor02),
    RadialChartDataModel(title: "Food",percentage:72,color: ColorConstants.orderColor03),
  ];

  void addCategoryAllCategory() {
    final today = AnalyticsCategoryModel(menuTitle: StringsConstants.today);
    final sales = AnalyticsCategoryModel(menuTitle: StringsConstants.sales);
    final orders = AnalyticsCategoryModel(menuTitle: StringsConstants.orders);
    final payments =
        AnalyticsCategoryModel(menuTitle: StringsConstants.payments);
    final menu = AnalyticsCategoryModel(menuTitle: StringsConstants.menu);
    final waiter = AnalyticsCategoryModel(menuTitle: StringsConstants.waiter);
    final placeholder =
        AnalyticsCategoryModel(menuTitle: StringsConstants.placeholder);
    final itemList = [
      today,
      sales,
      orders,
      payments,
      menu,
      waiter,
      placeholder
    ];
    _categoryList.addAll(itemList);
  }

  void selectCategory(int index) {
    int i = 0;
    for (var element in _categoryList) {
      if (index == i) {
        element.isSelected.value = true;
      } else {
        element.isSelected.value = false;
      }
      i += 1;
    }
  }

  void addPaymentTransaction(){
    final qrScan = PaymentModeModel(color: ColorConstants.paymentMode01, paymentType: "QR Scan", numberOfTransaction: "50", amount: "₹20,000");
    final cash = PaymentModeModel(color: ColorConstants.paymentMode02, paymentType: "Cash", numberOfTransaction: "5", amount: "₹5,000");
    final debitCreditCard = PaymentModeModel(color: ColorConstants.paymentMode03, paymentType: "Debit/Credit Card", numberOfTransaction: "5", amount: "₹10,000");
    final wallet = PaymentModeModel(color: ColorConstants.paymentMode04, paymentType: "Wallet", numberOfTransaction: "", amount: "₹0");
    final pos = PaymentModeModel(color: ColorConstants.paymentMode05, paymentType: "POS", numberOfTransaction: "5", amount: "₹2,000");
    final dineoutPay = PaymentModeModel(color: ColorConstants.paymentMode06, paymentType: "Dineout Pay", numberOfTransaction: "", amount: "₹0");
    final zomatoPay = PaymentModeModel(color: ColorConstants.paymentMode07, paymentType: "Zomato Pay", numberOfTransaction: "1", amount: "₹500");
    final due = PaymentModeModel(color: ColorConstants.paymentMode08, paymentType: "Due", numberOfTransaction: "1", amount: "₹300");
    final complimentary = PaymentModeModel(color: ColorConstants.paymentMode09, paymentType: "Complimentary", numberOfTransaction: "5", amount: "₹2,000");
    final itemList = [
      qrScan,
      cash,
      debitCreditCard,
      wallet,
      pos,
      dineoutPay,
      zomatoPay,
      due,
      complimentary
    ];
    _paymentTransaction.addAll(itemList);
  }

  void addTask(){
    final task01 = TaskModel(amount: "₹2,000", title: "SOS Request");
    final task02 = TaskModel(amount: "₹2,000", title: "Rating");
    final task03 = TaskModel(amount: "₹2,000", title: "Total Revenue");
    final itemList = [task01,task02,task03];
    _taskList.addAll(itemList);
  }
  
  void addTopSellingCategory(){
    final category1 = TopSellingCategoryModel(category: "Category 1", amount: "₹20,000", color: ColorConstants.paymentMode01);
    final category2 = TopSellingCategoryModel(category: "Category 2", amount: "₹5,000", color: ColorConstants.paymentMode08);
    final category3 = TopSellingCategoryModel(category: "Category 3", amount: "₹5,000", color: ColorConstants.paymentMode03);
    final category4 = TopSellingCategoryModel(category: "Category 4", amount: "₹5,000", color: ColorConstants.primaryColor);
    final category5 = TopSellingCategoryModel(category: "Category 5", amount: "₹10,000", color: ColorConstants.paymentMode02);
    final itemList = [category1,category2,category3,category4,category5];
    _topSellingCategory.addAll(itemList);
  }
}
