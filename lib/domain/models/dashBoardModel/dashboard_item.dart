
class DashboardItem {
  final String? title;
  final String? svgIcon;

  const DashboardItem({
     this.title,
     this.svgIcon,
  });
}

class DashboardItemSub {
  final String? title;
  final String? svgIcon;
  final List<DashboardItem>? dashboardItem;

  const DashboardItemSub({
    this.title,
    this.svgIcon,
    this.dashboardItem,
  });
}



