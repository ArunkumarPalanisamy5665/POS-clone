import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/network/base/base_vm.dart';
import 'package:new_hrms_flutter/views/widgets/common/common_widgets.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../widgets/common/country_data.dart';

class HomeVm extends BaseVm {
  bool isLoading = false;

  Map count = {};
  List barChartData = [];
  List pieChartData = [];
  List statisticsData = [];
  String? logo;
  String roleId = '1'; // ADMIN ROLE FOR TEST
  String isTeamLead = 'yes';

  final List<ChartData> chartData = [];

  Future<void> getDashboardCount(BuildContext context) async {
    setLoading();

    try {
      final map = {};

      final result = await apiHelper.post(
        '/${ApiEndpoints.dashboardCount}',
        data: map,
      );

      result.fold(
        (failure) {
          final message = failure.message.isNotEmpty
              ? failure.message
              : 'Login failed. Please try again.';

          CommonWidgets.showErrorToast(context, 'Error', message);

          setError(message);
        },
        (response) async {
          count = response['data'];

          print("gfjhsgdfjgsdfhgfhgsdfhgjdf  getBarChartData ${count}");

          // print("gfjhsgdfjgsdfhgfhgsdfhgjdf  dash board count $response");

          setSuccess();
        },
      );
    } catch (e) {
      setError("Unexpected error: $e");
    }
  }

  Future<void> punchInOut(BuildContext context) async {
    setLoading();

    try {
      final map = {};

      final result = await apiHelper.post(
        '/${ApiEndpoints.dashboardCount}',
        data: map,
      );

      result.fold(
        (failure) {
          final message = failure.message.isNotEmpty
              ? failure.message
              : 'Login failed. Please try again.';

          CommonWidgets.showErrorToast(context, 'Error', message);

          setError(message);
        },
        (response) async {
          setSuccess();
        },
      );
    } catch (e) {
      setError("Unexpected error: $e");
    }
  }

  Future<void> logOut(BuildContext context) async {
    setLoading();
  }

  Future<void> getBarChartData(BuildContext context) async {
    setLoading();

    try {
      final map = {};

      final result = await apiHelper.post(
        '/${ApiEndpoints.dashboardBarChartData}',
        data: map,
      );

      result.fold(
        (failure) {
          final message = failure.message.isNotEmpty
              ? failure.message
              : 'Login failed. Please try again.';

          CommonWidgets.showErrorToast(context, 'Error', message);

          setError(message);
        },
        (response) async {
          if (response['status_code'] == 1) {
              var data = response['chartData'];
              print("lsjdhfjhgjfhgjjhfgdhlfgdfgd ${data}");
              barChartData = data;

            chartData.clear();
            for (var item in barChartData) {
              chartData.add(ChartData(item['x'], "${item['total']}", "${item['pending']}"));
            }
          }
          // print("gfjhsgdfjgsdfhgfhgsdfhgjdf  getBarChartData ${response['data']}");

          setSuccess();
        },
      );
    } catch (e) {
      setError("Unexpected error: $e");
    }
  }

  Future<void> getPieChartData(BuildContext context) async {
    setLoading();

    try {
      final map = {};

      final result = await apiHelper.post(
        '/${ApiEndpoints.dashboardPieChartData}',
        data: map,
      );

      result.fold(
        (failure) {
          final message = failure.message.isNotEmpty
              ? failure.message
              : 'Login failed. Please try again.';

          CommonWidgets.showErrorToast(context, 'Error', message);

          setError(message);
        },
        (response) async {
          var data = response['chartData'];
          print("sakhfkjhdjdhgjkfdgjgjhfdkgjfdgh   ${data}");

          pieChartData = data;
          _setStaticPieChart();
          setSuccess();
        },
      );
    } catch (e) {
      setError("Unexpected error: $e");
    }
  }

  void _setStaticPieChart() {
    pieChartData = [
      {"name": "Projects", "value": 30},
      {"name": "Clients", "value": 15},
      {"name": "Employees", "value": 40},
      {"name": "Invoices", "value": 20},
    ];
  }

  Future<void> getStatisticsData(BuildContext context) async {
    setLoading();

    try {
      final map = {};

      final result = await apiHelper.post(
        '/${ApiEndpoints.dashboardStatistics}',
        data: map,
      );

      result.fold(
        (failure) {
          final message = failure.message.isNotEmpty
              ? failure.message
              : 'Login failed. Please try again.';

          CommonWidgets.showErrorToast(context, 'Error', message);

          setError(message);
        },
        (response) async {
          var data = response['Data'];
          statisticsData = data;
          setSuccess();
        },
      );
    } catch (e) {
      setError("Unexpected error: $e");
    }
  }
}

// class HomeVm extends BaseVm {
//   bool isLoading = false;
//
//   Map count = {};
//   List barChartData = [];
//   List pieChartData = [];
//   List statisticsData = [];
//   String? logo;
//   String roleId = '1';      // ADMIN ROLE FOR TEST
//   String isTeamLead = 'yes';
//
//   final List<ChartData> chartData = [];
//
//   // ---------------------------------------------------------------
//   // STATIC DATA FILLED FOR TESTING DASHBOARD UI
//   // ---------------------------------------------------------------
//   void _setStaticDashboardCount() {
//     count = {
//       "project_counts": 12,
//       "client_counts": 7,
//       "staff_counts": 28,
//       "invoice_counts": 15,
//       "task_counts": 96,
//       "today_absent": 3,
//       "today_present": 25,
//       "total_tickets": 44,
//       "open_tickets": 18,
//       "closed_tickets": 26,
//     };
//   }
//
//   void _setStaticPieChart() {
//     pieChartData = [
//       {"name": "Projects", "value": 30},
//       {"name": "Clients", "value": 15},
//       {"name": "Employees", "value": 40},
//       {"name": "Invoices", "value": 20},
//     ];
//   }
//
//   void _setStaticBarChart() {
//     chartData.clear();
//     chartData.addAll([
//       ChartData("Jan", "50", "20"),
//       ChartData("Feb", "80", "30"),
//       ChartData("Mar", "60", "10"),
//       ChartData("Apr", "90", "50"),
//       ChartData("May", "40", "5"),
//       ChartData("Jun", "110", "70"),
//     ]);
//   }
//
//   void _setStaticStatistics() {
//     statisticsData = [
//       {
//         "name": "Completed Tasks",
//         "actual_count": "45",
//         "total_count": "60",
//         "percentage": "75",
//       },
//       {
//         "name": "Pending Tasks",
//         "actual_count": "10",
//         "total_count": "60",
//         "percentage": "16",
//       },
//       {
//         "name": "Overdue Tasks",
//         "actual_count": "5",
//         "total_count": "60",
//         "percentage": "8",
//       },
//       {
//         "name": "Review Tasks",
//         "actual_count": "12",
//         "total_count": "60",
//         "percentage": "20",
//       },
//     ];
//   }
//
//   // ---------------------------------------------------------------
//   // SIMULATED API CALLS WITH STATIC DATA
//   // ---------------------------------------------------------------
//
//   Future<void> getDashboardCount(BuildContext context) async {
//     setLoading();
//     await Future.delayed(const Duration(milliseconds: 800)); // simulate API
//
//     _setStaticDashboardCount();
//     logo = null;  // or set Image URL
//     setSuccess();
//   }
//
//   Future<void> getBarChartData(BuildContext context) async {
//     setLoading();
//     await Future.delayed(const Duration(milliseconds: 500));
//
//     _setStaticBarChart();
//     setSuccess();
//   }
//
//   Future<void> getPieChartData(BuildContext context) async {
//     setLoading();
//     await Future.delayed(const Duration(milliseconds: 500));
//
//     _setStaticPieChart();
//     setSuccess();
//   }
//
//   Future<void> getStatisticsData(BuildContext context) async {
//     setLoading();
//     await Future.delayed(const Duration(milliseconds: 500));
//
//     _setStaticStatistics();
//     setSuccess();
//   }
//
//   Future<void> logOut(BuildContext context) async {}
//
// }
