import 'dart:ui';

class DashboardMetricItem {
  final String title;
  final String value;
  final String percentage;
  final bool isPositive;
  final String svgIcon;
  final List<Color> gradient;

  const DashboardMetricItem({
    required this.title,
    required this.value,
    required this.percentage,
    required this.isPositive,
    required this.svgIcon,
    required this.gradient,
  });
}
