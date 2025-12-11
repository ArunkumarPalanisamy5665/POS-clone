import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_colors.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/constants/app_assets.dart';
import '../../../main.dart';
import '../../widgets/animation/animator_zoom.dart';
import '../../widgets/common/country_data.dart';
import 'home_vm.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late HomeVm vm;


  int touchedIndex = -1;
  double seriesAnimation = 1500;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    vm = context.read<HomeVm>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.getDashboardCount(context);
      vm.getBarChartData(context);
      vm.getPieChartData(context);
      vm.getStatisticsData(context);
    });
   
    _tooltipBehavior = TooltipBehavior(enable: true, shouldAlwaysShow: true,color: Colors.white,);
    super.initState();
  }


  FutureOr onGoBack(dynamic value) {
    if (value == 'refresh') {
      vm.getDashboardCount(context);
    }
  }

  openProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var route = MaterialPageRoute(
      builder: (BuildContext context) => SizedBox()
          // EmployeeProfilePage(employeeId: prefs.getString('user_id') ?? ''),
    );
    Navigator.of(context).push(route).then(onGoBack);
  }

  openSettings() {
    OneContext().pushNamed('/settings').then(onGoBack);
  }

  Widget _getActionButton() {
    if (vm.roleId == '3') {
      return PopupMenuButton(
          child: Container(
              padding: const EdgeInsets.all(5),
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
          onSelected: (result) {
            switch (result) {
              case 0:
                {
                  openProfile();
                  break;
                }
              case 1:
                {
                  openSettings();
                  break;
                }
              case 2:
                {
                  vm.logOut(context);
                  break;
                }
            }
          },
          itemBuilder: (context) {
            List<PopupMenuEntry> a = [];
            a.add(PopupMenuItem(
              value: 0,
              child: Text(commonWidgets.translate('my_profile')),
            ));
            a.add(PopupMenuItem(
              value: 1,
              child: Text(commonWidgets.translate('settings')),
            ));
            a.add(PopupMenuItem(
              value: 2,
              child: Text(commonWidgets.translate('logout')),
            ));
            return a;
          });
    } else if (vm.roleId == '1') {
      return IconButton(
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        onPressed: () {
          vm.logOut(context);
        },
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }

  Widget _cardWidget(index) {
    Map list = {};
    if (vm.roleId == '1') {
      list[0] = {
        'icon': MyIcons.clipboard_list,
        'name': 'Projects',
        'title': commonWidgets.translate('projects'),
        'count': vm.count['project_counts']
      };
      list[1] = {
        'icon': MyIcons.user_1,
        'name': 'Clients',
        'title': commonWidgets.translate('clients'),
        'count': vm.count['client_counts']
      };
      list[2] = {
        'icon': MyIcons.user_tie,
        'name': 'Employees',
        'title': commonWidgets.translate('employees'),
        'count': vm.count['staff_counts']
      };
      list[3] = {
        'icon': MyIcons.file_invoice,
        'name': 'Invoices',
        'title': commonWidgets.translate('invoices'),
        'count': vm.count['invoice_counts']
      };
      list[3] = {
        'icon': MyIcons.file_invoice,
        'name': 'Invoices',
        'title': commonWidgets.translate('invoices'),
        'count': vm.count['invoice_counts']
      };
      list[4] = {
        'icon':  IconSet.iconTaskCount,
        'name': 'task_counts',
        'title': commonWidgets.translate('task_Counts'),
        'count': vm.count['task_counts']
      };
      list[5] = {
        'icon': IconSet.iconAbsentCount,
        'name': 'today_absent',
        'title': commonWidgets.translate('today_Absent'),
        'count': vm.count['today_absent']
      };
      list[6] = {
        'icon':IconSet.iconPresentCount,
        'name': 'today_present',
        'title': commonWidgets.translate('today_Present'),
        'count': vm.count['today_present']
      };
      list[7] = {
        'icon': IconSet.iconTicket,
        'name': 'total_tickets',
        'title': commonWidgets.translate('total_Tickets'),
        'count': vm.count['total_tickets']
      };
      list[8] = {
        'icon': IconSet.iconTicket,
        'name': 'open_tickets',
        'title': commonWidgets.translate('open_Tickets'),
        'count': vm.count['open_tickets']
      };
      list[9] = {
        'icon': IconSet.iconTicket,
        'name': 'closed_tickets',
        'title': commonWidgets.translate('closed_Tickets'),
        'count': vm.count['closed_tickets']
      };
    } else if (vm.roleId == '3') {
      list[0] = {
        'icon': MyIcons.clipboard_list,
        'name': 'Projects',
        'title': commonWidgets.translate('projects'),
        'count': vm.count['project_counts']
      };
      list[1] = {
        'icon': Icons.event,
        'name': 'Attendance',
        'title': commonWidgets.translate('attendance'),
      };
      list[2] = {
        'icon': MyIcons.file_contract,
        'name': 'Payroll',
        'title': commonWidgets.translate('payroll'),
      };
    }
    return SizedBox(
        child: InkWell(
            onTap: () {
              open(list[index]['name']);
            },
            child: ZoomANimator(Card(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                  width: MediaQuery.of(context).size.width * .40,
                  alignment: Alignment.center,
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 2, color: commonWidgets.secondaryColor)),
                        child: Icon(
                          list[index]['icon'],
                          size: 45,
                          color: commonWidgets.secondaryColor,
                        )),
                    const SizedBox(height: 5),
                    if (list[index].containsKey('count'))
                      Text(
                        list[index]['count'].toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 5),
                    Text(
                      list[index]['title'],
                      style: const TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ])),
            ))));
  }

  Widget _getDrawer() {
    TextStyle drawerTextStyle = const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
    List<Widget> options = [];
    if (vm.roleId == '3') {
      List pages = [
        {'title': commonWidgets.translate('dashboard'), 'route': '/home'},
        {'title': commonWidgets.translate('projects'), 'route': '/projects_list'},
        {'title': commonWidgets.translate('tasks'), 'route': '/tasks'},
        {'title': commonWidgets.translate('attendance'), 'route': '/attendance'},
        {'title': commonWidgets.translate('leave'), 'route': '/employee_leaves'},
        if(vm.isTeamLead == "yes")
          {'title': commonWidgets.translate('team_leaves'), 'route': '/team_leaves'},
        {'title': commonWidgets.translate('holiday'), 'route': '/holidays_list'},
      ];
      for (var page in pages) {
        print(page);
        var opt = ListTile(
            title: Text(page['title'], style: drawerTextStyle),
            onTap: () {
              openPage(page);
            });
        options.add(opt);
      }
    } else if (vm.roleId == '1') {
      List pages = [
        {'title': commonWidgets.translate('dashboard'), 'route': '/home'},
        {
          'title': commonWidgets.translate('employees'),
          'list': [
            {
              'title': commonWidgets.translate('employees'),
              'route': '/employees_list'
            },
            {
              'title': commonWidgets.translate('holiday'),
              'route': '/holidays_list'
            },
            {
              'title': commonWidgets.translate('attendance_info'),
              'route': '/attendance_list'
            },
            {'title': commonWidgets.translate('leave'), 'route': '/leave_list'},
            {
              'title':
              '${commonWidgets.translate('departments')} & ${commonWidgets.translate('designations')}',
              'route': '/department_list'
            },
          ]
        },
        {'title': commonWidgets.translate('projects'), 'route': '/projects_list'},
        {'title': commonWidgets.translate('tasks'), 'route': '/tasks'},
        {'title': commonWidgets.translate('clients'), 'route': '/clients_list'},
        {'title': commonWidgets.translate('Assets'), 'route': '/assets_list'},
        {
          'title': commonWidgets.translate('account'),
          'list': [
            {
              'title': commonWidgets.translate('categories'),
              'route': '/categories_list'
            },
            {
              'title': commonWidgets.translate('estimates'),
              'route': '/estimate_list'
            },
            {
              'title': commonWidgets.translate('invoices'),
              'route': '/invoice_list'
            },
            {
              'title': commonWidgets.translate('payments'),
              'route': '/payment_list'
            },
            {
              'title': commonWidgets.translate('expenses'),
              'route': '/expense_list'
            },
            {
              'title': commonWidgets.translate('budgets'),
              'route': '/budgets_list'
            },
          ]
        },
        {
          'title': commonWidgets.translate('payroll'),
          'list': [
            {
              'title': commonWidgets.translate('pay_run'),
              'route': '/salary_list'
            },
          ]
        },
        {'title': commonWidgets.translate('settings'), 'route': '/settings'},
      ];
      for (var page in pages) {
        print(page);
        if (!page.containsKey('list')) {
          var opt = ListTile(
              title: Text(page['title'], style: drawerTextStyle),
              onTap: () {
                openPage(page);
              });
          options.add(opt);
        } else {
          List<Widget> inneritem = [];
          page['list'].forEach((innerPage) {
            var innerOpt = ListTile(
                contentPadding: const EdgeInsets.only(left: 40),
                title: Text(innerPage['title'], style: drawerTextStyle),
                onTap: () {
                  openPage(innerPage);
                });
            inneritem.add(innerOpt);
          });

          var controller = AnimationController(
              duration: const Duration(milliseconds: 200), vsync: this);
          Animatable<double> easeInTween = CurveTween(curve: Curves.easeIn);
          Animatable<double> halfTween = Tween<double>(begin: 0.0, end: 0.5);
          var iconTurns = controller.drive(halfTween.chain(easeInTween));

          var exOpt = ExpansionTile(
            trailing: RotationTransition(
              turns: iconTurns,
              child: const Icon(
                Icons.expand_more,
                color: Colors.white,
              ),
            ),
            title: Text(page['title'], style: drawerTextStyle),
            children: inneritem,
          );
          options.add(exOpt);
        }
      }
    }
    return Drawer(

        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              toolbarHeight: 0,
            ),
            body: Container(
                color: AppColors.primaryColor,
                child: ListView(
                    padding: const EdgeInsets.all(10), children: options))));
  }



  showOptions() {}

  open(name) {
    print(name + " => pressed");
    switch (name) {
      case 'Projects':
        {
          OneContext().pushNamed('/projects_list').then(onGoBack);
        }
        break;
      case 'Clients':
        {
          OneContext().pushNamed('/clients_list').then(onGoBack);
        }
        break;
      case 'Employees':
        {
          OneContext().pushNamed('/employees_list').then(onGoBack);
        }
        break;
      case 'Invoices':
        {
          OneContext().pushNamed('/invoice_list').then(onGoBack);
        }
        break;
      case 'Attendance':
        {
          OneContext().pushNamed('/attendance').then(onGoBack);
        }
        break;
      case 'Payroll':
        {
          OneContext().pushNamed('/salary_list').then(onGoBack);
        }
        break;
      default:
    }
  }

  openPage(page) {
    print("page");
    // Navigator.of(context).pop();
    if (page['route'] != '/home') {
      OneContext().pushNamed(page['route']).then(onGoBack);
    }
  }

  getCards() {
    return List.generate((vm.roleId == '3') ? 3 : 10, (index) {
      return Center(child: _cardWidget(index));
    });
  }

  Future<void> _doRefresh() async {
    setState(() {
      vm.getDashboardCount(context);
      vm.getBarChartData(context);
      vm.getPieChartData(context);
      vm.getStatisticsData(context);

    });
  }
  //
  // final List<ListItems> list = [
  //   ListItems(data: 100, color: Colors.deepOrange, task: 'Completed Task'),
  //   ListItems(
  //       data: 40, color: Colors.deepPurpleAccent, task: 'Inprogress Tasks'),
  //   ListItems(data: 20, color: Colors.deepPurple, task: 'On Hold Tasks'),
  //   ListItems(data: 60, color: Colors.pink, task: 'Pending Tasks'),
  //   ListItems(data: 10, color: Colors.yellow, task: 'Review Tasks'),
  // ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Added 300 milliseconds to the series animation duration and provided it as the duration for the Timer.
      Timer(Duration(milliseconds: seriesAnimation.toInt() + 300), () {
        // Activated the tooltip of the second data point’s index.
        _tooltipBehavior.showByIndex(0, 2);
      });
    });
    var maxWidth = MediaQuery.of(context).size.width * .50;
    var width = MediaQuery.of(context).size.width;
    var columns = (width ~/ maxWidth) + 1;
    var columnWidth = width / columns;
//136 is the height of one grid item
    var aspectRatio = columnWidth / 136;
    return Consumer<HomeVm>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          actions: <Widget>[_getActionButton()],
        ),
        drawer: _getDrawer(),
        body: RefreshIndicator(
          onRefresh: _doRefresh,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Container(
                  //   color: AppColors.primaryColor,
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 160,
                  //   alignment: Alignment.center,
                  //   child: (vm.logo != null)
                  //       ? Image.network(
                  //     vm.logo!,
                  //     width: MediaQuery.of(context).size.width * 0.7,
                  //   )
                  //       : Image.asset(
                  //     'assets/images/logo.png',
                  //     width: MediaQuery.of(context).size.width * 0.7,
                  //   ),
                  // ),

                  const SizedBox(height: 140,
                  child: Text.rich(
                    TextSpan(
                      text: "Smart ",
                      style: TextStyle(
                        fontSize: 40,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "HR",
                          style: TextStyle(
                            fontSize: 40,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height  -
                        (160 + kToolbarHeight),
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    child: (vm.count.isNotEmpty)
                        ? SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.count(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            childAspectRatio: aspectRatio,
                            crossAxisCount: 2,
                            children: (vm.roleId == '3' || vm.roleId == '1')
                                ? getCards()
                                : [],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if(vm.roleId =="1")
                            buildPieChart(),
                          if(vm.roleId =="1")
                            const SizedBox(
                              height: 20,
                            ),
                          if(vm.roleId =="1")
                            buildBarGraph(),
                          if(vm.roleId =="1")
                            const SizedBox(
                              height: 20,
                            ),
                          if(vm.roleId =="1")
                          //buildTaskStatistics(),
                            buildStatistics(),
                          if(vm.roleId =="1")
                            const SizedBox(
                              height: 50,
                            ),
                        ],
                      ),
                    )
                        : const SizedBox(
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },);
  }

  Widget buildPieChart() {
    return ZoomANimator(
      Card(
        elevation: 8,
        color: Colors.white,
        child: Container(
          //  height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Overview',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      PieChart(
                        swapAnimationDuration: Duration(milliseconds: 150),
                        PieChartData(
                          centerSpaceRadius: 0,
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 1,
                          pieTouchData: PieTouchData(
                            enabled: vm.pieChartData.isNotEmpty,
                            touchCallback: (FlTouchEvent event, PieTouchResponse? touchResponse) {
                              if (!mounted) return;
                              setState(() {
                                touchedIndex = event is FlLongPressEnd
                                    ? -1
                                    : touchResponse?.touchedSection?.touchedSectionIndex ?? -1;
                              });
                            },
                          ),
                          sections: vm.pieChartData
                              .where((item) => (item["value"] ?? 0) > 0)   // avoid zero-values
                              .map((item) {
                            final double value =
                                double.tryParse(item["value"].toString()) ?? 0.0;

                            return PieChartSectionData(
                              value: value,
                              showTitle: false,
                              radius: 100,
                              color: _getColor(item["name"]),
                            );
                          }).toList(),
                        ),
                      ),
                      if (touchedIndex != -1 && touchedIndex < vm.pieChartData.length)
                        _buildTooltip(touchedIndex),
                    ],
                  ),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemCount: vm.pieChartData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: vm.pieChartData[index]["name"] == "Projects"
                                ? const Color(0xFFCC727E)
                                :vm.pieChartData[index]["name"] == "Clients"
                                ? const Color(0xFFFF9B44)
                                : vm.pieChartData[index]["name"] == "Employees"
                                ? const Color(0xFFBA7F50)
                                : const Color(0xFFD36913),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          vm.pieChartData[index]["name"],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 40),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(String name) {
    switch (name) {
      case "Projects": return Color(0xFFCC727E);
      case "Clients": return Color(0xFFFF9B44);
      case "Employees": return Color(0xFFBA7F50);
      default: return Color(0xFFD36913);
    }
  }

  Widget _buildTooltip(int index) {
    final item = vm.pieChartData[index];

    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _getColor(item["name"]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "${item["name"]}: ${item["value"]}",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }



  Widget buildBarGraph() {
    return ZoomANimator(
      Card(
        elevation: 8,
        color: Colors.white,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Invoice',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SfCartesianChart(
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        shouldAlwaysShow: true,
                        header: "",
                        textStyle: const TextStyle(
                            color: Colors.white
                        ),
                        color: commonWidgets.primaryColor,// Background color of the tooltip
                        format: 'point.x , point.y', // Customize text as needed
                      ),
                      backgroundColor: Colors.transparent,
                      primaryXAxis: CategoryAxis(
                        interval: 1,
                        majorGridLines: const MajorGridLines(width: 0),
                        axisLine: const AxisLine(width: 0),
                      ),
                      primaryYAxis: NumericAxis(
                        axisLine: const AxisLine(width: 0),
                      ),
                      series: <CartesianSeries>[
                        ColumnSeries<ChartData, String>(
                          color: const Color(0xFFFF9B44),
                          dataSource: vm.chartData,
                          width: 1,
                          borderRadius: BorderRadius.circular(4.0),
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => int.parse(
                            data.y.toString(),
                          ),
                        ),
                        ColumnSeries<ChartData, String>(
                          color: const Color(0xFFCC727E),
                          dataSource: vm.chartData,
                          width: 1,
                          borderRadius: BorderRadius.circular(4.0),
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => int.parse(
                            data.y1.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: const Color(0xFFFF9B44),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: const Color(0xFFCC727E),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Pending',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildTaskStatistics() {
  //   return ZoomANimator(
  //     Card(
  //       elevation: 8,
  //       color: Colors.white,
  //       child: Container(
  //         // width: double.infinity,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(8.0),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const SizedBox(
  //                 height: 16,
  //               ),
  //               const Text(
  //                 "Task Statistics",
  //                 style: TextStyle(fontSize: 18),
  //               ),
  //               const SizedBox(
  //                 height: 16,
  //               ),
  //               Flex(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 direction: Axis.horizontal,
  //                 children: [
  //                   Container(
  //                     height: 80,
  //                     width: 100,
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(4.0),
  //                         border: Border.all(color: Colors.grey)),
  //                     child: const Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           "Total task",
  //                           style: TextStyle(fontSize: 16),
  //                         ),
  //                         Text(
  //                           "0",
  //                           style: TextStyle(
  //                               fontSize: 16, fontWeight: FontWeight.w600),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                     height: 80,
  //                     width: 100,
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(4.0),
  //                         border: Border.all(color: Colors.grey)),
  //                     child: const Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           "Overdue task",
  //                           textAlign: TextAlign.center,
  //                           style: TextStyle(fontSize: 16),
  //                         ),
  //                         Text(
  //                           "0",
  //                           style: TextStyle(
  //                               fontSize: 16, fontWeight: FontWeight.w600),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 16,
  //               ),
  //               SizedBox(
  //                 height: MediaQuery.sizeOf(context).height / 18,
  //                 child: ListView.builder(
  //                   shrinkWrap: true,
  //                   scrollDirection: Axis.horizontal,
  //                   itemCount: 5,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     final data = list.elementAt(index);
  //                     return Container(
  //                         width: MediaQuery.sizeOf(context).width / 5,
  //                         height: MediaQuery.sizeOf(context).height / 18,
  //                         decoration: BoxDecoration(
  //                           borderRadius: index == 0
  //                               ? const BorderRadius.only(
  //                                   topLeft: Radius.circular(8.0),
  //                                   bottomLeft: Radius.circular(8.0),
  //                                 )
  //                               : index == 4
  //                                   ? const BorderRadius.only(
  //                                       topRight: Radius.circular(8.0),
  //                                       bottomRight: Radius.circular(8.0),
  //                                     )
  //                                   : BorderRadius.zero,
  //                           color: data.color,
  //                         ),
  //                         child: Center(child: Text(data.data.toString())));
  //                   },
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 16,
  //               ),
  //               SizedBox(
  //                 height: 150,
  //                 child: ListView.separated(
  //                   shrinkWrap: true,
  //                   scrollDirection: Axis.vertical,
  //                   itemCount: 5,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     final data = list.elementAt(index);
  //                     return Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Container(
  //                           height: 20,
  //                           width: 20,
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(4.0),
  //                               color: data.color),
  //                         ),
  //                         const SizedBox(
  //                           width: 8,
  //                         ),
  //                         Text(
  //                           data.task,
  //                           style: const TextStyle(fontWeight: FontWeight.w500),
  //                         ),
  //                         const Spacer(),
  //                         Text(
  //                           data.count.toString(),
  //                           style: const TextStyle(fontWeight: FontWeight.w500),
  //                         ),
  //                       ],
  //                     );
  //                   },
  //                   separatorBuilder: (BuildContext context, int index) {
  //                     return const SizedBox(
  //                       height: 6,
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget buildStatistics() {
    return ZoomANimator(
      Card(
        elevation: 8,
        color: Colors.white,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Statistics',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: ListView.separated(
                    itemCount: vm.statisticsData.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final data = vm.statisticsData.elementAt(index);
                      print("Data ${data['percentage']}");
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data['name'],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${data['actual_count']} / ${data['total_count']}',
                                    style: const TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LinearProgressIndicator(
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey,
                                  //   backgroundColor: commonWidgets.primaryColor,
                                  valueColor: AlwaysStoppedAnimation(
                                      commonWidgets.primaryColor),
                                  value:
                                  double.parse(data['percentage']) / 100.0,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

