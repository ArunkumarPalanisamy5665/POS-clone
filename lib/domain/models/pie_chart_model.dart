class PieChartModel {
  int? statusCode;
  String? message;
  Data? data;

  PieChartModel({this.statusCode, this.message, this.data});

  PieChartModel.fromJson(Map<String, dynamic> json) {
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
  String? metric;
  String? granularity;
  String? startDate;
  String? endDate;
  List<String>? labels;
  List<int>? values;
  List<String>? colors;
  int? total;

  Data(
      {this.metric,
        this.granularity,
        this.startDate,
        this.endDate,
        this.labels,
        this.values,
        this.colors,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    metric = json['metric'];
    granularity = json['granularity'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    labels = json['labels'].cast<String>();
    values = json['values'].cast<int>();
    colors = json['colors'].cast<String>();
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['metric'] = this.metric;
    data['granularity'] = this.granularity;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['labels'] = this.labels;
    data['values'] = this.values;
    data['colors'] = this.colors;
    data['total'] = this.total;
    return data;
  }
}