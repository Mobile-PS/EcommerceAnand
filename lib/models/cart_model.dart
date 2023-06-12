class CartModel {
  List<CartDetails>? cartDetails;

  CartModel({this.cartDetails});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['cartDetails'] != null) {
      cartDetails = <CartDetails>[];
      json['cartDetails'].forEach((v) {
        cartDetails!.add(new CartDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartDetails != null) {
      data['cartDetails'] = this.cartDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartDetails {
  int? cdId;
  int? cdCartId;
  int? cdProductId;
  dynamic? cdRemarks;
  String? cdCreatedTime;
  double? cdAmount;
  double? cdQty;
  Product? product;

  CartDetails(
      {this.cdId,
        this.cdCartId,
        this.cdProductId,
        this.cdRemarks,
        this.cdCreatedTime,
        this.cdAmount,
        this.cdQty,
        this.product});

  CartDetails.fromJson(Map<String, dynamic> json) {
    cdId = json['cdId'];
    cdCartId = json['cdCartId'];
    cdProductId = json['cdProductId'];
    cdRemarks = json['cdRemarks'];
    cdCreatedTime = json['cdCreatedTime'];
    cdAmount = json['cdAmount'];
    cdQty = json['cdQty'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cdId'] = this.cdId;
    data['cdCartId'] = this.cdCartId;
    data['cdProductId'] = this.cdProductId;
    data['cdRemarks'] = this.cdRemarks;
    data['cdCreatedTime'] = this.cdCreatedTime;
    data['cdAmount'] = this.cdAmount;
    data['cdQty'] = this.cdQty;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? categoryId;
  String? category;
  int? subCategoryId;
  String? subCategory;
  String? productName;
  double? price;
  dynamic? brand;
  dynamic? description;
  int? quantity;
  dynamic? status;
  double? discount;
  dynamic? size;
  dynamic? color;
  String? fileName;
  String? fileType;
  String? images;
  String? data;
  User? user;

  Product(
      {this.id,
        this.categoryId,
        this.category,
        this.subCategoryId,
        this.subCategory,
        this.productName,
        this.price,
        this.brand,
        this.description,
        this.quantity,
        this.status,
        this.discount,
        this.size,
        this.color,
        this.fileName,
        this.fileType,
        this.images,
        this.data,
        this.user});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    category = json['category'];
    subCategoryId = json['subCategoryId'];
    subCategory = json['subCategory'];
    productName = json['productName'];
    price = json['price'];
    brand = json['brand'];
    description = json['description'];
    quantity = json['quantity'];
    status = json['status'];
    discount = json['discount'];
    size = json['size'];
    color = json['color'];
    fileName = json['fileName'];
    fileType = json['fileType'];
    images = json['images'];
    data = json['data'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['category'] = this.category;
    data['subCategoryId'] = this.subCategoryId;
    data['subCategory'] = this.subCategory;
    data['productName'] = this.productName;
    data['price'] = this.price;
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['discount'] = this.discount;
    data['size'] = this.size;
    data['color'] = this.color;
    data['fileName'] = this.fileName;
    data['fileType'] = this.fileType;
    data['images'] = this.images;
    data['data'] = this.data;
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