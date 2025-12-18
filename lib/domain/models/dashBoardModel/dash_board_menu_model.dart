import '../../../core/constants/app_assets.dart';


class RestaurantItem {
  final String? title;
  final String? svgIcon;

  const RestaurantItem({
    this.title,
    this.svgIcon,
  });
}

class ToolBarItem {
  final String? title;
  final String? svgIcon;

  const ToolBarItem({
    this.title,
    this.svgIcon,
  });
}

class DashboardItem {
  final String title;
  final String svgIcon;
  final String route;

  const DashboardItem({
    required this.title,
    required this.svgIcon,
    required this.route,
  });
}

class DashboardItemSub {
  final String title;
  final String svgIcon;
  final List<DashboardItem> dashboardItem;

  const DashboardItemSub({
    required this.title,
    required this.svgIcon,
    required this.dashboardItem,
  });
}


final List<DashboardItemSub> dashboardIcons = [
  DashboardItemSub(
    title: 'Main',
    svgIcon: AppAssets.mainMenuIcon,
    dashboardItem: [
      DashboardItem(
        title: 'Dashboard',
        svgIcon: AppAssets.mainMenuIcon,
        route: '/dashboard',
      ),
      DashboardItem(
        title: 'New Order',
        svgIcon: AppAssets.subPosIcon,
        route: '/pos',
      ),
      DashboardItem(
        title: 'Order List',
        svgIcon: AppAssets.subOderIcon,
        route: '/orders',
      ),
      DashboardItem(
        title: 'Kitchen',
        svgIcon: AppAssets.subKitchenIcon,
        route: '/kitchen',
      ),
      DashboardItem(
        title: 'Reservation',
        svgIcon: AppAssets.subReservationIcon,
        route: '/reservation',
      ),
    ],
  ),
  DashboardItemSub(
    title: 'Menu Management',
    svgIcon: AppAssets.manageIcon,
    dashboardItem: [
      DashboardItem(
        title: 'Order List',
        svgIcon: AppAssets.dropMenu2,
        route: '/orders',
      ),
      DashboardItem(
        title: 'Overview',
        svgIcon: AppAssets.dropMenu2,
        route: '/dashboard',
      ),
    ],
  ),
  DashboardItemSub(
    title: 'Operations',
    svgIcon: AppAssets.operationIcon,
    dashboardItem: [
      DashboardItem(
        title: 'Order List',
        svgIcon: AppAssets.dropMenu2,
        route: '/orders',
      ),
      DashboardItem(
        title: 'Overview',
        svgIcon: AppAssets.dropMenu2,
        route: '/dashboard',
      ),
    ],
  ),
  DashboardItemSub(
    title: 'Administration',
    svgIcon: AppAssets.adminIcon,
    dashboardItem: [
      DashboardItem(
        title: 'Order List',
        svgIcon: AppAssets.dropMenu2,
        route: '/orders',
      ),
      DashboardItem(
        title: 'Overview',
        svgIcon: AppAssets.dropMenu2,
        route: '/dashboard',
      ),
    ],
  ),
  DashboardItemSub(
    title: 'Pages',
    svgIcon: AppAssets.authIcon,
    dashboardItem: [
      DashboardItem(
        title: 'Order List',
        svgIcon: AppAssets.dropMenu2,
        route: '/orders',
      ),
      DashboardItem(
        title: 'Overview',
        svgIcon: AppAssets.dropMenu2,
        route: '/dashboard',
      ),
    ],
  ),

  DashboardItemSub(
    title: 'Settings',
    svgIcon: AppAssets.settingsIcon,
    dashboardItem: [
      DashboardItem(
        title: 'Order List',
        svgIcon: AppAssets.dropMenu2,
        route: '/orders',
      ),
      DashboardItem(
        title: 'Overview',
        svgIcon: AppAssets.dropMenu2,
        route: '/dashboard',
      ),
    ],
  ),
];

final List<DashboardItem> toolList = [
  DashboardItem(
    title: 'POS',
    svgIcon: AppAssets.handePOSIcon,
    route: '/pos',
  ),
  DashboardItem(
    title: 'Orders',
    svgIcon: AppAssets.subOderIcon,
    route: '/orders',
  ),
  DashboardItem(
    title: 'Kitchen',
    svgIcon: AppAssets.subKitchenIcon,
    route: '/kitchen',
  ),
  DashboardItem(
    title: 'Reservation',
    svgIcon: AppAssets.subReservationIcon,
    route: '/reservation',
  ),
  DashboardItem(
    title: 'Table',
    svgIcon: AppAssets.tablePOSIcon,
    route: '/table',
  ),
];

