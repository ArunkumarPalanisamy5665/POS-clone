import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_hrms_flutter/core/constants/app_assets.dart';
import '../../../domain/models/menu_modal.dart';
import '../responsive/responsive.dart';


class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  // NAVIGATION CALLBACK
  final Function(int index)? onMenuTap;

  // DIRECT PARAMETERS
  final double width;
  final double iconSize;
  final double fontSize;

  final Color backgroundColor;
  final Color hoverBackgroundColor;
  final Color selectedBackgroundColor;

  final Color textColor;
  final Color hoverTextColor;
  final Color selectedTextColor;

  final Color iconColor;
  final Color hoverIconColor;
  final Color selectedIconColor;

  const SideMenu({
    super.key,
    required this.scaffoldKey,
    this.onMenuTap,

    this.width = 200,
    this.iconSize = 22,
    this.fontSize = 16,

    this.backgroundColor = const Color(0xFF171821),
    this.hoverBackgroundColor = const Color(0x22FF0000),
    this.selectedBackgroundColor = Colors.red,

    this.textColor = Colors.grey,
    this.hoverTextColor = Colors.red,
    this.selectedTextColor = Colors.white,

    this.iconColor = Colors.grey,
    this.hoverIconColor = Colors.red,
    this.selectedIconColor = Colors.white,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "Dashboard"),
    MenuModel(icon: 'assets/svg/profile.svg', title: "Profile"),
    MenuModel(icon: 'assets/svg/exercise.svg', title: "Exercise"),
    MenuModel(icon: 'assets/svg/setting.svg', title: "Settings"),
    MenuModel(icon: 'assets/svg/history.svg', title: "History"),
    MenuModel(icon: 'assets/svg/signout.svg', title: "Signout"),
  ];

  int selected = 0;
  int? hoverIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: double.infinity,
      color: widget.backgroundColor,

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                      image: AssetImage(AppAssets.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                for (int i = 0; i < menu.length; i++)
                  MouseRegion(
                    onEnter: (_) => setState(() => hoverIndex = i),
                    onExit: (_) => setState(() => hoverIndex = null),

                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: selected == i
                            ? widget.selectedBackgroundColor
                            : hoverIndex == i
                            ? widget.hoverBackgroundColor
                            : Colors.transparent,
                      ),

                      child: InkWell(

                        onTap: () {
                          setState(() => selected = i);

                          // TRIGGER NAVIGATION CALL
                          widget.onMenuTap?.call(i);

                          widget.scaffoldKey.currentState?.closeDrawer();
                        },

                        child: Responsive.isDesktop(context)
                            ? Column(
                          children: [
                            SvgPicture.asset(
                              menu[i].icon,
                              width: widget.iconSize,
                              height: widget.iconSize,
                              color: selected == i
                                  ? widget.selectedIconColor
                                  : hoverIndex == i
                                  ? widget.hoverIconColor
                                  : widget.iconColor,
                            ),

                            const SizedBox(height: 8),

                            Text(
                              menu[i].title,
                              style: TextStyle(
                                fontSize: widget.fontSize,
                                color: selected == i
                                    ? widget.selectedTextColor
                                    : hoverIndex == i
                                    ? widget.hoverTextColor
                                    : widget.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                            : Row(
                          children: [
                            SvgPicture.asset(
                              menu[i].icon,
                              width: widget.iconSize,
                              height: widget.iconSize,
                              colorFilter: ColorFilter.mode(selected == i
                                  ? widget.selectedIconColor
                                  : hoverIndex == i
                                  ? widget.hoverIconColor
                                  : widget.iconColor, BlendMode.srcIn) ,
                            ),

                            const SizedBox(width: 12),

                            Text(
                              menu[i].title,
                              style: TextStyle(
                                fontSize: widget.fontSize,
                                color: selected == i
                                    ? widget.selectedTextColor
                                    : hoverIndex == i
                                    ? widget.hoverTextColor
                                    : widget.textColor,
                                fontWeight: selected == i
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

