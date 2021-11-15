class CategoryVM {
  int? id;
  String? categoryName;
  String? seoUrl;

  CategoryVM({this.id, this.categoryName, this.seoUrl});

  CategoryVM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    seoUrl = json['seoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['seoUrl'] = this.seoUrl;
    return data;
  }
}
