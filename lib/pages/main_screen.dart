import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_request/apis/category_api.dart';
import 'package:http_request/apis/product_api.dart';
import 'package:http_request/models/category.dart';
import 'package:http_request/models/product.dart';
import 'package:http_request/widgets/product_list_widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<CategoryVM> categories = [];
  List<Widget> categoryWidgets = [];
  List<ProductVM> products = [];
  @override
  void initState() {
    getCategoriesFromApi();
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alışveriş Sistemi'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductList(
              products: products,
            )
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        categories = list.map((e) => CategoryVM.fromJson(e)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    categories.forEach((element) {
      categoryWidgets.add(getCategoryWidget(element));
    });
    return categoryWidgets;
  }

  Widget getCategoryWidget(CategoryVM element) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              getProductByCategoryId(element);
            },
            child: Text(
              element.categoryName.toString(),
              style: TextStyle(color: Colors.red),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red))))),
      ],
    );
  }

  void getProductByCategoryId(CategoryVM category) {
    ProductApi.getProductsByCategoryId(int.parse(category.id.toString()))
        .then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        products = list.map((e) => ProductVM.fromJson(e)).toList();
      });
    });
  }

  void getProduct() {
    ProductApi.getProducts().then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        products = list.map((e) => ProductVM.fromJson(e)).toList();
      });
    });
  }
}
