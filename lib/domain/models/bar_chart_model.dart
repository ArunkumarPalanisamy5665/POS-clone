class BarChartModel {
  int? statusCode;
  String? message;
  Data? data;

  BarChartModel({this.statusCode, this.message, this.data});

  BarChartModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? labels;
  List<Datasets>? datasets;
  Meta? meta;

  Data({this.labels, this.datasets, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    labels = json['labels'].cast<String>();
    if (json['datasets'] != null) {
      datasets = <Datasets>[];
      json['datasets'].forEach((v) {
        datasets!.add(new Datasets.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labels'] = this.labels;
    if (this.datasets != null) {
      data['datasets'] = this.datasets!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Datasets {
  String? label;
  List<int>? data;
  String? backgroundColor;

  Datasets({this.label, this.data, this.backgroundColor});

  Datasets.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    data = json['data'].cast<int>();
    backgroundColor = json['backgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['data'] = this.data;
    data['backgroundColor'] = this.backgroundColor;
    return data;
  }
}

class Meta {
  String? rangeStart;
  String? rangeEnd;
  String? granularity;

  Meta({this.rangeStart, this.rangeEnd, this.granularity});

  Meta.fromJson(Map<String, dynamic> json) {
    rangeStart = json['range_start'];
    rangeEnd = json['range_end'];
    granularity = json['granularity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['range_start'] = this.rangeStart;
    data['range_end'] = this.rangeEnd;
    data['granularity'] = this.granularity;
    return data;
  }
}