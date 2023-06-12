class ProductModel {
  List<Products>? products;

  ProductModel({this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? categoryId;
  String? category;
  int? subCategoryId;
  String? subCategory;
  String? productName;
  dynamic? price;
  String? brand;
  String? description;
  int? quantity;
  String? status;
  dynamic? discount;
  String? size;
  dynamic? color;
  String? fileName;
  String? fileType;
  String? data;

  Products(
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
        this.data});

  Products.fromJson(Map<String, dynamic> json) {
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
    data = json['data'];
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
    data['data'] = this.data;
    return data;
  }
}