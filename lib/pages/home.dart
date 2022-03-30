import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/themes.dart';
import '../widgets/item_widget.dart';
import 'dart:convert';
import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
                else
                  const Center(child: CircularProgressIndicator())
              ],
        ),
      ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "PakCraft Store Online".text.xl3.bold.color(MyThemes.darkBlueColor).make(),
        "Trending Products".text.xl.make()
      ],
    );
}
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
            CatalogImage(image: catalog.image),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.color(MyThemes.darkBlueColor).extraBold.make(),
                  catalog.desc.toString().substring(0,30).text.make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "Rs. ${catalog.price}".text.bold.make(),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              MyThemes.darkBlueColor
                            ),
                            shape: MaterialStateProperty.all(
                              const StadiumBorder(),
                            )
                          ),
                          child: "Buy".text.make())
                    ],
                  ).pOnly(right: 8.0)
                ],
              )
          )
          ],
      )
    ).color(MyThemes.creamColor).rounded.square(200).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.color(Colors.red).make().p16().w40(context);

  }
}

