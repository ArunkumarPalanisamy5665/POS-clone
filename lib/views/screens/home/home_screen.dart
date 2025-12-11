

import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/widgets/appDrawer/custom_drawer.dart';
import 'package:new_hrms_flutter/views/widgets/responsive/responsive.dart';
import 'package:new_hrms_flutter/views/widgets/sideMenu/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return CustomDrawer(
      scaffoldKey:  _scaffoldKey,
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: !Responsive.isDesktop(context)? AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.dashboard_customize_rounded,
            color: Colors.black87,
          ),
        ),
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ): null,
     drawer: !Responsive.isDesktop(context)? SideMenu(scaffoldKey: _scaffoldKey): null,
      child: Row(
        children: [
          if(Responsive.isDesktop(context))...[
            Expanded(
                child: SideMenu(
                  scaffoldKey: _scaffoldKey,

                  onMenuTap: (index) {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, "/dashboard");
                        break;
                      case 1:
                        Navigator.pushNamed(context, "/profile");
                        break;
                      case 2:
                        Navigator.pushNamed(context, "/exercise");
                        break;
                      case 3:
                        Navigator.pushNamed(context, "/settings");
                        break;
                      case 4:
                        Navigator.pushNamed(context, "/history");
                        break;
                      case 5:
                        Navigator.pushNamed(context, "/logout");
                        break;
                    }
                  },

                  width: 70,
                  iconSize: 15,
                  fontSize: 10,
                  // backgroundColor: Color(0xFF171821),
                  hoverBackgroundColor: Colors.red.withOpacity(0.1),
                  selectedBackgroundColor: Colors.red,
                  iconColor: Colors.grey,
                  textColor: Colors.grey,
                  hoverTextColor: Colors.red,
                  hoverIconColor: Colors.red,
                  selectedTextColor: Colors.white,
                  selectedIconColor: Colors.white,
                )
            ),
          ],
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: dashboardItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 4 : 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: isTablet ? 1.3 : 1,
                ),
                itemBuilder: (context, index) {
                  final item = dashboardItems[index];
                  return DashboardCard(
                    title: item.title,
                    icon: item.icon,
                    color: item.color,
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              radius: 32,
              child: Icon(
                icon,
                size: 30,
                color: color,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;

  DashboardItem(this.title, this.icon, this.color);
}

final List<DashboardItem> dashboardItems = [
  DashboardItem("Employees", Icons.people_alt_rounded, Colors.blue),
  DashboardItem("Attendance", Icons.access_time_filled, Colors.green),
  DashboardItem("Leave", Icons.calendar_month, Colors.orange),
  DashboardItem("Payroll", Icons.payments, Colors.pink),
  DashboardItem("Departments", Icons.business_center, Colors.purple),
  DashboardItem("Tasks", Icons.task, Colors.indigo),
  DashboardItem("Settings", Icons.settings, Colors.grey),
  DashboardItem("Reports", Icons.analytics_outlined, Colors.red),
];

