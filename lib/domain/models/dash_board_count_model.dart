class DashBoardCountModel {
  int? statusCode;
  String? message;
  Data? data;

  DashBoardCountModel({this.statusCode, this.message, this.data});

  DashBoardCountModel.fromJson(Map<String, dynamic> json) {
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
  int? totalEmployees;
  int? presentToday;
  int? absentToday;
  int? onLeaveToday;
  int? pendingLeaveApprovals;
  int? projectsActive;
  int? tasksOverdue;
  int? unapprovedTimesheets;
  int? unpaidInvoices;
  int? expensesPending;
  String? todayWorkedHoursTotal;
  // List<dynamic>? upcomingBirthdays;

  Data(
      {this.totalEmployees,
        this.presentToday,
        this.absentToday,
        this.onLeaveToday,
        this.pendingLeaveApprovals,
        this.projectsActive,
        this.tasksOverdue,
        this.unapprovedTimesheets,
        this.unpaidInvoices,
        this.expensesPending,
        this.todayWorkedHoursTotal,
        });

  Data.fromJson(Map<String, dynamic> json) {
    totalEmployees = json['total_employees'];
    presentToday = json['present_today'];
    absentToday = json['absent_today'];
    onLeaveToday = json['on_leave_today'];
    pendingLeaveApprovals = json['pending_leave_approvals'];
    projectsActive = json['projects_active'];
    tasksOverdue = json['tasks_overdue'];
    unapprovedTimesheets = json['unapproved_timesheets'];
    unpaidInvoices = json['unpaid_invoices'];
    expensesPending = json['expenses_pending'];
    todayWorkedHoursTotal = json['today_worked_hours_total'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_employees'] = this.totalEmployees;
    data['present_today'] = this.presentToday;
    data['absent_today'] = this.absentToday;
    data['on_leave_today'] = this.onLeaveToday;
    data['pending_leave_approvals'] = this.pendingLeaveApprovals;
    data['projects_active'] = this.projectsActive;
    data['tasks_overdue'] = this.tasksOverdue;
    data['unapproved_timesheets'] = this.unapprovedTimesheets;
    data['unpaid_invoices'] = this.unpaidInvoices;
    data['expenses_pending'] = this.expensesPending;
    data['today_worked_hours_total'] = this.todayWorkedHoursTotal;
    return data;
  }
}