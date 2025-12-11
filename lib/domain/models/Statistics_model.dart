
class StatisticsModel {
  int? statusCode;
  String? message;
  Data? data;

  StatisticsModel({this.statusCode, this.message, this.data});

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? metricGroup;
  String? granularity;
  String? startDate;
  String? endDate;
  List<Statistics>? statistics;

  Data(
      {this.metricGroup,
        this.granularity,
        this.startDate,
        this.endDate,
        this.statistics});

  Data.fromJson(Map<String, dynamic> json) {
    metricGroup = json['metric_group'];
    granularity = json['granularity'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(new Statistics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['metric_group'] = this.metricGroup;
    data['granularity'] = this.granularity;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Statistics {
  String? key;
  String? title;
  int? value;
  String? unit;
  int? previousValue;
  int? change;
  int? changePct;
  String? trend;
  String? trendColor;
  String? icon;

  Statistics(
      {this.key,
        this.title,
        this.value,
        this.unit,
        this.previousValue,
        this.change,
        this.changePct,
        this.trend,
        this.trendColor,
        this.icon});

  Statistics.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    value = json['value'];
    unit = json['unit'];
    previousValue = json['previous_value'];
    change = json['change'];
    changePct = json['change_pct'];
    trend = json['trend'];
    trendColor = json['trend_color'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['value'] = this.value;
    data['unit'] = this.unit;
    data['previous_value'] = this.previousValue;
    data['change'] = this.change;
    data['change_pct'] = this.changePct;
    data['trend'] = this.trend;
    data['trend_color'] = this.trendColor;
    data['icon'] = this.icon;
    return data;
  }
}