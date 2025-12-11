import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_hrms_flutter/core/constants/app_colors.dart';

import '../../core/state/app_state_provider.dart';
import '../widgets/appDrawer/custom_drawer.dart';
import '../widgets/sideMenu/custom_bottom_bar.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  final GoRouterState state;

  final bool showBottomBar;

  const AppShell({
    required this.child,
    required this.state,
    this.showBottomBar = true,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late int _selectedIndex;
  bool profileExpanded = false;
  bool get isWeb => kIsWeb;

  @override
  void initState() {
    super.initState();
    _updateSelectedIndex();
  }

  @override
  void didUpdateWidget(AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSelectedIndex();
  }

  void _updateSelectedIndex() {
    final location = widget.state.uri.toString();

    if (location.startsWith('/home')) {
      _selectedIndex = 0;
    } else if (location.startsWith('/profile/info')) {
      _selectedIndex = 11;
    } else if (location.startsWith('/profile/documents')) {
      _selectedIndex = 12;
    } else if (location.startsWith('/profile/settings')) {
      _selectedIndex = 13;
    } else if (location.startsWith('/profile')) {
      _selectedIndex = 1;
    } else if (location.startsWith('/settings')) {
      _selectedIndex = 2;
    } else if (location.startsWith('/attendance')) {
      _selectedIndex = 3;
    } else {
      _selectedIndex = 0;
    }
  }


  void _onBottomNavTapped(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/profile');
        break;
      case 2:
        context.go('/settings');
        break;
      case 3:
        context.go('/attendance');
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return isMobile ? _buildMobileLayout() : _buildWebLayout();
  }


  Widget _buildMobileLayout() {
    final app = AppStateProvider.of(context);
    return CustomDrawer(
      drawer: widget.showBottomBar ? null : _buildMobileDrawer(),
      bottomNavigationBar: widget.showBottomBar
          ?  CustomBottomBar(
        selectedIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        backgroundColor: !app.isDarkMode ? Colors.black.withOpacity(0.25) : Colors.white,
        selectedBackgroundColor: Colors.transparent,
        iconColor: !app.isDarkMode ? Colors.white70 :Colors.grey,
        selectedIconColor: !app.isDarkMode ? Colors.white: Colors.black,
        textColor: !app.isDarkMode ? Colors.white70 : Colors.black,
        selectedTextColor: !app.isDarkMode ? Colors.white : Colors.black,
        unSelectedTextColor: Colors.grey,
        iconSize: 18,
        selectedIconSize: 20,
      )
          : null,
      child: widget.child,
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF3F51B5)),
            child: Center(
              child: Text(
                "HRMS System",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),

          _drawerTile(Icons.home, "Home", () => context.go('/home')),
          _drawerTile(Icons.person, "Profile", () => context.go('/profile')),
          _drawerTile(Icons.settings, "Settings", () => context.go('/settings')),
          _drawerTile(Icons.check_circle, "Attendance", () => context.go('/attendance')),
        ],
      ),
    );
  }

  Widget _drawerTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[800]),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }


  Widget _buildWebLayout() {
    return Scaffold(
      body: Row(
        children: [
          _buildWebSidebar(),

          Expanded(
            child: Column(
              children: [
                AppBar(
                  title: const Text("HRMS Dashboard"),
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0,
                ),

                Expanded(
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 950),
                      padding: const EdgeInsets.all(20),
                      child: widget.child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildWebSidebar() {
    return Container(
      width: 270,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2E3B8F),
            Color(0xFF1A237E),
            Color(0xFF0D1333),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 26),
            _profileCard(),
            const SizedBox(height: 22),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  // HOME
                  _sidebarTileHover(
                    icon: Icons.dashboard,
                    label: "Home",
                    selected: _selectedIndex == 0,
                    onTap: () {
                      setState(() => _selectedIndex = 0);
                      context.go('/home');
                    },
                  ),

                  // PROFILE (Expandable)
                  _sidebarExpandableHover(
                    icon: Icons.person_outline,
                    title: "Profile",
                    expanded: profileExpanded,
                    isSelected: _selectedIndex == 1 ||
                        _selectedIndex == 11 ||
                        _selectedIndex == 12 ||
                        _selectedIndex == 13,
                    onTap: () {
                      setState(() {
                        profileExpanded = !profileExpanded;
                        _selectedIndex = 1;
                      });
                      context.go('/profile');
                    },
                    children: [
                      _sidebarSubTile(
                        icon: Icons.info_outline,
                        label: "Info",
                        selected: _selectedIndex == 11,
                        onTap: () {
                          setState(() => _selectedIndex = 11);
                          context.go('/profile/info');
                        },
                      ),
                      _sidebarSubTile(
                        icon: Icons.folder_open,
                        label: "Documents",
                        selected: _selectedIndex == 12,
                        onTap: () {
                          setState(() => _selectedIndex = 12);
                          context.go('/profile/documents');
                        },
                      ),
                      _sidebarSubTile(
                        icon: Icons.settings,
                        label: "Settings",
                        selected: _selectedIndex == 13,
                        onTap: () {
                          setState(() => _selectedIndex = 13);
                          context.go('/profile/settings');
                        },
                      ),
                    ],
                  ),

                  // SETTINGS
                  _sidebarTileHover(
                    icon: Icons.settings_outlined,
                    label: "Settings",
                    selected: _selectedIndex == 2,
                    onTap: () {
                      setState(() => _selectedIndex = 2);
                      context.go('/settings');
                    },
                  ),

                  // ATTENDANCE
                  _sidebarTileHover(
                    icon: Icons.check_circle_outline,
                    label: "Attendance",
                    selected: _selectedIndex == 3,
                    onTap: () {
                      setState(() => _selectedIndex = 3);
                      context.go('/attendance');
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "HRMS v1.0.0",
                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.15),
            Colors.white.withOpacity(0.05),
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: const [
          CircleAvatar(radius: 32, backgroundColor: Colors.white, child: Icon(Icons.person, size: 35)),
          SizedBox(height: 10),
          Text("Guest User", style: TextStyle(color: Colors.white, fontSize: 17)),
          SizedBox(height: 2),
          Text("guest@example.com", style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _sidebarTileHover({
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    ValueNotifier<bool> hover = ValueNotifier(false);

    return MouseRegion(
      onEnter: isWeb ? (_) => hover.value = true : null,
      onExit: isWeb ? (_) => hover.value = false : null,
      child: ValueListenableBuilder(
        valueListenable: hover,
        builder: (_, bool hovering, __) {
          final active = selected || hovering;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: active ? Colors.white.withOpacity(0.18) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTap,
              child: Row(
                children: [
                  Icon(icon, color: active ? Colors.white : Colors.white70),
                  const SizedBox(width: 14),
                  Text(
                    label,
                    style: TextStyle(
                      color: active ? Colors.white : Colors.white70,
                      fontSize: 15,
                      fontWeight: active ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _sidebarSubTile({
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    ValueNotifier<bool> hover = ValueNotifier(false);

    return MouseRegion(
      onEnter: isWeb ? (_) => hover.value = true : null,
      onExit: isWeb ? (_) => hover.value = false : null,
      child: ValueListenableBuilder(
        valueListenable: hover,
        builder: (_, bool hovering, __) {
          final active = selected || hovering;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: active ? Colors.white.withOpacity(0.18) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTap,
              child: Row(
                children: [
                  Icon(icon, size: 20, color: active ? Colors.white : Colors.white70),
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: TextStyle(
                      color: active ? Colors.white : Colors.white70,
                      fontSize: 14,
                      fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _sidebarExpandableHover({
    required IconData icon,
    required String title,
    required bool expanded,
    required bool isSelected,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sidebarTileHover(
          icon: icon,
          label: title,
          selected: isSelected,
          onTap: onTap,
        ),

        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          crossFadeState:
          expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

}
