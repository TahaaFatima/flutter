import 'dart:convert';

import 'package:ecommerce_app/models/ProductsModel.dart';
import 'package:ecommerce_app/screens/item_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ProductsModel productsModel =
  //     ProductsModel(id: 0, title: '', description: '', category: '', price: 0);

  List<ProductsModel> globalProductsList = [];

  Future<void> getAllProducts() async {
    List<ProductsModel> productsList = [];

    try {
      var response = await Dio().get('https://fakestoreapi.com/products');

      if (response.statusCode == 200 &&
          (response.data as List<dynamic>).isNotEmpty) {
        List<dynamic> productsRawData = response.data;

        for (var i = 0; i < productsRawData.length; i++) {
          ProductsModel _productsModel =
              ProductsModel.fromJson(productsRawData[i]);
          productsList.add(_productsModel);
        }

        setState(() {
          globalProductsList = productsList;
          print(globalProductsList);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecommerce Application"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: globalProductsList.length,
              itemBuilder: (_, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ItemDetailScreen(
                          currentProduct: globalProductsList[i]);
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(5)),
                            child: Image.network(
                              globalProductsList[i].image,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(globalProductsList[i].title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      globalProductsList[i].category,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star_outlined,
                                          size: 15,
                                          color: Colors.amber[800],
                                        ),
                                        Text(
                                          "4.6",
                                          style: TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              globalProductsList[i].price.toString() + "\$",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
        ]),
      ),
    );
  }
}
