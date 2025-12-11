class ApiEndpoints {
  // Base URLs
  static const String baseUrl = "https://logicielx.dreamstechnologies.com/";

  static const String appVersion = "1.0.0";

  //Gemini
  static const String geminiFlashDesc = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent";

  // Auth / User
  static const String login = "api/appuser/login";
  static const String profile = "api/profile";
  static const String editProfile = "api/view_profile";
  static const String forgotPassword = "api/forgot_password";
  static const String changePassword = "api/change_password";

  // Employee / Workspace
  static const String checkWorkspace = "appuser/check_workspace";
  static const String addEmployee = "appuser/create_employee";
  static const String removeEmployee = "api/remove_profile";
  static const String getEmployeeList = "api/employee_list";

  // Departments & Designations
  static const String getDepartments = "api/departments";
  static const String addDept = "api/create_department";
  static const String getDesignations = "api/designations";
  static const String addDesignation = "api/create_designations";

  // Leaves & Attendance
  static const String getLeaves = "api/leaves";
  static const String addLeaveRequest = "api/leave_apply";
  static const String getLeaveTypes = "api/leave_type";
  static const String cancelLeaveRequest = "api/leave_cancel";
  static const String acceptRejectLeave = "api/leave_approve_reject";
  static const String attendanceDetails = "api/attendance_details";
  static const String punchIn = "appuser/punch_in";
  static const String punchOut = "appuser/punch_out";
  static const String punchInStatus = "appuser/user_punch_in_details";
  static const String attendanceList = "api/attendance_list";
  static const String attendanceInfo = "api/attendance_info";
  static const String createAttendance = "api/create_attendance";

  // Holidays
  static const String getHolidays = "api/holidays";
  static const String addHoliday = "api/create_holiday";
  static const String removeHoliday = "api/remove_holiday";
  static const String editHoliday = "api/edit_holiday";

  // Assets & Categories
  static const String getSubCategories = "api/sub_categories";
  static const String addCategory = "api/create_category";
  static const String addSubCategory = "api/create_sub_category";
  static const String addAsset = "api/create_asset";
  static const String getAssetsList = "assets";
  static const String editCategory = "api/edit_category";
  static const String editSubCategory = "api/edit_sub_category";
  static const String editAsset = "api/edit_asset";
  static const String deleteCategory = "api/delete_category";
  static const String deleteSubCategory = "api/delete_sub_category";
  static const String deleteAsset = "api/delete_asset";

  // Projects / Clients / Tasks
  static const String getProjectList = "api/all_projects";
  static const String getProjectDetails = "api/projects_details";
  static const String createProject = "appuser/create_project";
  static const String editProject = "appuser/edit_project";
  static const String deleteProject = "appuser/delete_project";

  static const String createTask = "appuser/create_task";
  static const String completeTask = "appuser/task_completion";
  static const String taskView = "appuser/task_view";

  static const String getClientList = "api/client_list";
  static const String getClientProfile = "api/client_profile";
  static const String createClient = "appuser/create_client";
  static const String editClient = "appuser/edit_client";
  static const String deleteClient = "appuser/delete_client";

  // Invoices / Estimates / Budget / Salary
  static const String getInvoicesList = "api/invoice_list";
  static const String createInvoice = "appuser/create_invoice";
  static const String editInvoice = "appuser/edit_invoice";
  static const String deleteInvoice = "appuser/delete_invoice";

  static const String getEstimatesList = "api/estimate_list";
  static const String createEstimate = "appuser/create_estimate";
  static const String editEstimate = "appuser/edit_estimate";
  static const String deleteEstimate = "appuser/delete_estimate";

  static const String getSalaryList = "api/payslip_users_list";
  static const String addSalary = "api/add_salary";
  static const String generatePayslip = "api/run_payroll";
  static const String getPdf = "api/payslip_pdf";

  static const String getBudgetList = "api/budget_list";
  static const String createBudget = "api/create_budget";
  static const String editBudget = "api/edit_budget";
  static const String deleteBudget = "api/delete_budget";

  // Miscellaneous
  static const String profileImageUpload = "appuser/user_profilepic_upload";
  static const String colorCode = "appuser/app_colorcode";
  static const String dashboardCount = "api/mobile/dashboard_count";
  static const String dashboardBarChartData = "api/mobile/dashboard_barchart_list";
  static const String dashboardPieChartData = "api/mobile/dashboard_piechart_list";
  static const String dashboardStatistics = "api/mobile/dashboard_statistics_list";
  static const String convertCurrency = "api/currency_convert";
  static const String reportingTo = "api/reporting_officer";

  // Info endpoints
  static const String basicInfo = "api/basic_info";
  static const String personalInfo = "api/personal_info";
  static const String emergencyInfo = "api/emergency_info";
  static const String bankInfo = "api/bank_info";
  static const String educationInfo = "api/education_info";
  static const String experienceInfo = "api/experience_info";

  static const String getLanguageList = "api/translate_list";
}

