import 'package:flutter/material.dart';
import 'package:http_request/models/product.dart';

class ProductListRow extends StatefulWidget {
  ProductVM? product;
  ProductListRow({Key? key, this.product}) : super(key: key);

  @override
  _ProductListRowState createState() => _ProductListRowState();
}

class _ProductListRowState extends State<ProductListRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2021/04/05/14/48/cheese-platter-6153716_960_720.jpg'),
              height: 130,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(widget.product!.productName.toString()),
            Text(
              widget.product!.unitPrice.toString(),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
