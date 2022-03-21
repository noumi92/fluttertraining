import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'dart:convert';
import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Nouman Karim";
  final int age = 32;
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    List<Item> list = List.from(productsData)
                      .map<Item>((item) => Item.fromMap(item)).toList();
    CatalogModel.items = list;

    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(50, (index) => CatalogModel.items[1]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16
            ),
            itemBuilder: (context, index){
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GridTile(
                  header: Container(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      item.name, style: const TextStyle(color: Colors.white),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple
                    ),
                  ),
                  child: Image.network(
                      item.image
                  ),
                  footer: Container(
                    margin: EdgeInsets.only(top: 8.0, right: 4.0, bottom: 2.0),
                      alignment: Alignment.centerRight,
                      child: Text(item.price.toString()),
                  ),
                )
              );
            },
            itemCount: CatalogModel.items.length,
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }
}
