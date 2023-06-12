
import 'package:shop_app/models/product_model.dart';

class DrawerDataModel {
  List<CategoriesWrapper>? categoriesWrapper;

  DrawerDataModel({this.categoriesWrapper});

  DrawerDataModel.fromJson(Map<String, dynamic> json) {
    if (json['categoriesWrapper'] != null) {
      categoriesWrapper = <CategoriesWrapper>[];
      json['categoriesWrapper'].forEach((v) {
        categoriesWrapper!.add(new CategoriesWrapper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoriesWrapper != null) {
      data['categoriesWrapper'] =
          this.categoriesWrapper!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesWrapper {
  int? id;
  String? categoryName;
  List<SubCategoriesList>? subCategoriesList;

  CategoriesWrapper({this.id, this.categoryName, this.subCategoriesList});

  CategoriesWrapper.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    if (json['subCategoriesList'] != null) {
      subCategoriesList = <SubCategoriesList>[];
      json['subCategoriesList'].forEach((v) {
        subCategoriesList!.add(new SubCategoriesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    if (this.subCategoriesList != null) {
      data['subCategoriesList'] =
          this.subCategoriesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoriesList {
  int? id;
  int? categoryId;
  String? category;
  String? subCategory;
  List<Products>? subCategoriesProductList;

  SubCategoriesList(
      {this.id,
        this.categoryId,
        this.category,
        this.subCategory,
        this.subCategoriesProductList});

  SubCategoriesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    category = json['category'];
    subCategory = json['subCategory'];
    if (json['subCategoriesProductList'] != null) {
      subCategoriesProductList = <Products>[];
      json['subCategoriesProductList'].forEach((v) {
        subCategoriesProductList!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    if (this.subCategoriesProductList != null) {
      data['subCategoriesProductList'] =
          this.subCategoriesProductList!.map((v) => v.toJson()).toList();
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