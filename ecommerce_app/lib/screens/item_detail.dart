import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/ProductsModel.dart';

class ItemDetailScreen extends StatefulWidget {
  // const ItemDetailScreen({Key? key}) : super(key: key);
  dynamic currentProduct;
  ItemDetailScreen({required this.currentProduct});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  ProductsModel productsModel = ProductsModel(
      id: 0, title: '', description: '', category: '', price: 0, image: '');

  Future<void> getAProduct({String id = '1'}) async {
    try {
      print(widget.currentProduct.id);
      var response = await Dio().get('https://fakestoreapi.com/products/$id');

      if (response.statusCode == 200 &&
          (response.data as Map<String, dynamic>).isNotEmpty) {
        setState(() {
          productsModel = ProductsModel.fromJson(response.data);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    getAProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${productsModel.title}"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              child: Image.network(
                "${productsModel.image}",
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.width * 0.75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${productsModel.title}",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "${productsModel.price}",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700]),
              )
            ],
          ),
          Text(
            "${productsModel.category}",
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Description:",
                style: TextStyle(
                    fontSize: 16, decoration: TextDecoration.underline),
              )),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("${productsModel.description}"),
          )
        ]),
      )),
    );
  }
}
