import 'package:flutter/material.dart';
import 'package:http_request/models/product.dart';
import 'package:http_request/widgets/product_list_row_widget.dart';

class ProductList extends StatefulWidget {
  List<ProductVM>? products = [];

  ProductList({Key? key, this.products}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 500,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products!.length, (index) {
              return ProductListRow(
                product: widget.products![index],
              );
            }),
          ),
        ),
      ],
    );
  }
}
