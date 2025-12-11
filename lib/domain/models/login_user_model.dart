class LoginUserModel {
  bool? status;
  String? message;
  User? user;

  LoginUserModel({this.status, this.message, this.user});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? mobile;
  String? phone;
  String? username;
  String? email;
  String? createdAt;
  String? updatedAt;
  Company? company;
  List<String>? roleName;
  String? uniqueCode;
  String? companyName;

  User(
      {this.id,
        this.name,
        this.mobile,
        this.phone,
        this.username,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.company,
        this.roleName,
        this.uniqueCode,
        this.companyName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    phone = json['phone'];
    username = json['username'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    roleName = json['role_name'].cast<String>();
    uniqueCode = json['unique_code'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['role_name'] = this.roleName;
    data['unique_code'] = this.uniqueCode;
    data['company_name'] = this.companyName;
    return data;
  }
}

class Company {
  int? id;
  String? companyName;
  String? email;
  String? logo;

  Company({this.id, this.companyName, this.email, this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    email = json['email'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['email'] = this.email;
    data['logo'] = this.logo;
    return data;
  }
}