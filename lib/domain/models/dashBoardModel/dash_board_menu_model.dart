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
  const DashboardItemSub(
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
  const DashboardItemSub(
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
  const DashboardItemSub(
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
  const DashboardItemSub(
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
  const DashboardItemSub(
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

  const DashboardItemSub(
    title: 'Settings',
    svgIcon: AppAssets.settingsIcon,
    dashboardItem: [
      DashboardItem(
        title: 'Store Settings',
        svgIcon: AppAssets.storeSettingsIcon,
        route: '/store-settings',
      ),
      DashboardItem(
        title: 'Tax',
        svgIcon: AppAssets.taxIcon,
        route: '/tax-settings',
      ),
      DashboardItem(
        title: 'Print',
        svgIcon: AppAssets.printIcon,
        route: '/print-settings',
      ),
      DashboardItem(
        title: 'Payment Types',
        svgIcon: AppAssets.paymentTypesIcon,
        route: '/payment-types',
      ),
      DashboardItem(
        title: 'Delivery',
        svgIcon: AppAssets.deliveryIcon,
        route: '/delivery',
      ),
      DashboardItem(
        title: 'Notifications',
        svgIcon: AppAssets.notificationSettingsIcon,
        route: '/notification-settings',
      ),
      DashboardItem(
        title: 'Integrations / API',
        svgIcon: AppAssets.intergrationApiIcon,
        route: '/integration-api',
      ),
    ],
  ),
];

final List<DashboardItem> toolList = [
  const DashboardItem(
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

