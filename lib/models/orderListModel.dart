
class OrderListModel {
  List<Orders>? orders;

  OrderListModel({this.orders});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? customerId;
  String? customerName;
  String? shippingAddress;
  String? orderDate;
  String? shippingDate;
  dynamic? quantity;
  dynamic? totalPrice;
  String? status;
  String? mobileNo;
  String? paymentMode;
  String? paymentStatus;
  String? transactionId;
  dynamic? shippingPay;
  User? user;

  Orders(
      {this.id,
        this.customerId,
        this.customerName,
        this.shippingAddress,
        this.orderDate,
        this.shippingDate,
        this.quantity,
        this.totalPrice,
        this.status,
        this.mobileNo,
        this.paymentMode,
        this.paymentStatus,
        this.transactionId,
        this.shippingPay,
        this.user});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    customerName = json['customerName'];
    shippingAddress = json['shipping_address'];
    orderDate = json['order_date'];
    shippingDate = json['shipping_date'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    status = json['status'];
    mobileNo = json['mobile_no'];
    paymentMode = json['payment_mode'];
    paymentStatus = json['payment_Status'];
    transactionId = json['transaction_id'];
    shippingPay = json['shipping_pay'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['customerName'] = this.customerName;
    data['shipping_address'] = this.shippingAddress;
    data['order_date'] = this.orderDate;
    data['shipping_date'] = this.shippingDate;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['mobile_no'] = this.mobileNo;
    data['payment_mode'] = this.paymentMode;
    data['payment_Status'] = this.paymentStatus;
    data['transaction_id'] = this.transactionId;
    data['shipping_pay'] = this.shippingPay;
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