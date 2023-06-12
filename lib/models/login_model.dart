class LoginModel {
  int? id;
  String? username;
  String? password;
  int? userId;
  User? user;

  LoginModel({this.id, this.username, this.password, this.userId, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    userId = json['userId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['userId'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? username;
  dynamic? email;
  String? password;
  String? role;
  int? age;
  String? address;
  String? city;
  String? country;
  String? phoneNo;
  bool? active;
  dynamic? userType;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.password,
        this.role,
        this.age,
        this.address,
        this.city,
        this.country,
        this.phoneNo,
        this.active,
        this.userType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    age = json['age'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    phoneNo = json['phoneNo'];
    active = json['active'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['age'] = this.age;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['phoneNo'] = this.phoneNo;
    data['active'] = this.active;
    data['userType'] = this.userType;
    return data;
  }
}