class ProductVM {
  int? id;
  int? categoryId;
  String? productName;
  String? quantityPerUnit;
  double? unitPrice;
  double? unitsInStock;

  ProductVM(
      {this.id,
      this.categoryId,
      this.productName,
      this.quantityPerUnit,
      this.unitPrice,
      this.unitsInStock});

  ProductVM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    productName = json['productName'];
    quantityPerUnit = json['quantityPerUnit'];
    unitPrice = double.parse(json['unitPrice'].toString());
    unitsInStock = double.parse(json['unitsInStock'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['productName'] = this.productName;
    data['quantityPerUnit'] = this.quantityPerUnit;
    data['unitPrice'] = this.unitPrice;
    data['unitsInStock'] = this.unitsInStock;
    return data;
  }
}
